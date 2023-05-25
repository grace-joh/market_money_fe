require 'rails_helper'

RSpec.describe MarketService do
  let(:service) { MarketService.new }

  describe 'all_markets' do
    it 'returns all markets data' do
      expect(service.all_markets).to be_a(Hash)
      expect(service.all_markets[:data]).to be_an(Array)

      markets_data = service.all_markets[:data]

      expect(markets_data.count).to eq(846)

      market = markets_data.first

      expect(market).to have_key(:id)
      expect(market[:id]).to be_a(String)
      expect(market).to have_key(:type)
      expect(market[:type]).to eq('market')
      expect(market).to have_key(:attributes)
      expect(market[:attributes]).to be_a(Hash)

      expect(market[:attributes]).to have_key(:name)
      expect(market[:attributes][:name]).to be_a(String)
      expect(market[:attributes]).to have_key(:street)
      expect(market[:attributes][:street]).to be_a(String)
      expect(market[:attributes]).to have_key(:city)
      expect(market[:attributes][:city]).to be_a(String)
      expect(market[:attributes]).to have_key(:state)
      expect(market[:attributes][:state]).to be_a(String)
      expect(market[:attributes]).to have_key(:zip)
      expect(market[:attributes][:zip]).to be_a(String)
    end
  end

  describe 'market_by(id)' do
    it 'returns market data for a specific market' do
      market = service.market_by(322474)
      expect(market).to be_a(Hash)

      market_data = service.market_by(322474)[:data]
      expect(market_data).to be_a(Hash)
      expect(market_data).to have_key(:id)
      expect(market_data[:id]).to be_a(String)
      expect(market_data).to have_key(:type)
      expect(market_data[:type]).to eq('market')
      expect(market_data).to have_key(:attributes)
      attributes = market_data[:attributes]
      expect(attributes).to be_a(Hash)
      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)
      expect(attributes).to have_key(:street)
      expect(attributes[:street]).to be_a(String)
      expect(attributes).to have_key(:city)
      expect(attributes[:city]).to be_a(String)
      expect(attributes).to have_key(:state)
      expect(attributes[:state]).to be_a(String)
      expect(attributes).to have_key(:zip)
      expect(attributes[:zip]).to be_a(String)
    end
  end

  describe 'vendors_by_market(id)' do
    it 'returns vendor data for a specific market' do
      vendors = service.vendors_by_market(322474)
      expect(vendors).to be_a(Hash)
      expect(vendors[:data]).to be_an(Array)

      vendors_data = vendors[:data]
      expect(vendors_data.count).to eq(35)

      vendors_data.each do |vendor|
        expect(vendor).to have_key(:id)
        expect(vendor[:id]).to be_a(String)
        expect(vendor).to have_key(:type)
        expect(vendor[:type]).to eq('vendor')
        expect(vendor).to have_key(:attributes)
        attributes = vendor[:attributes]
        expect(attributes).to be_a(Hash)
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a(String)
        expect(attributes).to have_key(:description)
        expect(attributes[:description]).to be_a(String)
        expect(attributes).to have_key(:contact_name)
        expect(attributes[:contact_name]).to be_a(String)
        expect(attributes).to have_key(:contact_phone)
        expect(attributes[:contact_phone]).to be_a(String)
        expect(attributes).to have_key(:credit_accepted)
        expect(attributes[:credit_accepted]).to be(true).or be(false)
      end
    end
  end
end
