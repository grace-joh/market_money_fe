require 'rails_helper'

RSpec.describe Market do
  describe 'initialize' do
    it 'exists' do
      market_data = { id: '331074',
                      type: 'market',
                      attributes:
                      { name: "Yancey County Farmers' Market",
                        street: 'Town Center',
                        city: 'Burnsville',
                        county: 'Yancey',
                        state: 'North Carolina',
                        zip: '28714',
                        lat: '35.916916',
                        lon: '-82.300264',
                        vendor_count: 13 } }
      market = Market.new(market_data)

      expect(market).to be_a(Market)
      expect(market.id).to eq('331074')
      expect(market.name).to eq("Yancey County Farmers' Market")
      expect(market.street).to eq('Town Center')
      expect(market.city).to eq('Burnsville')
      expect(market.state).to eq('North Carolina')
      expect(market.zip).to eq('28714')
    end
  end
end
