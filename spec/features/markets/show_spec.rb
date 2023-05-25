require 'rails_helper'

RSpec.describe 'Market Show Page' do
  let(:market) { MarketFacade.new.market_with_vendors(322474) }

  it 'displays all markets' do
    visit market_path(market.id)

    expect(page).to have_content(market.name)
    within('div.market-address') do
      expect(page).to have_content(market.street)
      expect(page).to have_content(market.city)
      expect(page).to have_content(market.state)
      expect(page).to have_content(market.zip)
    end

    within('section.vendors-list') do
      expect(page).to have_content('Vendors at our Market')
      market.vendors.each do |vendor|
        expect(page).to have_content(vendor.name)
      end
    end
  end
end
