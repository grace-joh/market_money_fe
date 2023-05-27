require 'rails_helper'

RSpec.describe MarketFacade, :vcr do
  before(:all) do
    @facade = MarketFacade.new
  end

  describe 'all_markets' do
    it 'returns all Markets as an array of objects' do
      markets = @facade.all_markets
      expect(markets).to be_an(Array)
      expect(markets.count).to eq(846)
      expect(markets).to all(be_a(Market))
    end
  end

  describe 'market_with_vendors' do
    it 'returns a Market object with vendors' do
      market = @facade.market_with_vendors(322474)
      expect(market).to be_a(Market)
      expect(market.vendors).to be_an(Array)
      expect(market.vendors).to all(be_a(VendorBase))
      expect(market.vendors.count).to eq(35)
    end
  end
end
