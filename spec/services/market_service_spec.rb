require 'rails_helper'

RSpec.describe MarketService do
  before(:all) do
    @service = MarketService.new
  end
  describe 'market_data' do
    it 'returns all markets data' do
      expect(@service.all_markets).to be_a(Hash)
      expect(@service.all_markets[:data]).to be_an(Array)

      markets_data = @service.all_markets[:data]

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
      expect(market[:attributes]).to have_key(:county)
      expect(market[:attributes][:county]).to be_a(String)
      expect(market[:attributes]).to have_key(:state)
      expect(market[:attributes][:state]).to be_a(String)
      expect(market[:attributes]).to have_key(:zip)
      expect(market[:attributes][:zip]).to be_a(String)
      expect(market[:attributes]).to have_key(:lat)
      expect(market[:attributes][:lat]).to be_a(String)
      expect(market[:attributes]).to have_key(:lon)
      expect(market[:attributes][:lon]).to be_a(String)
      expect(market[:attributes]).to have_key(:vendor_count)
      expect(market[:attributes][:vendor_count]).to be_an(Integer)
    end
  end
end
