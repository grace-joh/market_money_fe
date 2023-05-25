require 'rails_helper'

RSpec.describe MarketFacade do
  before(:all) do
    @facade = MarketFacade.new
  end

  describe 'all_markets' do
    it 'returns all Markets as an array of objects' do
      expect(@facade.all_markets).to be_an(Array)
      expect(@facade.all_markets.count).to eq(846)
      expect(@facade.all_markets).to all(be_a(Market))
    end
  end
end
