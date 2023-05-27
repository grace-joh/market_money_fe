require 'rails_helper'

RSpec.describe 'Market Index Page', :vcr do
  let(:markets) { MarketFacade.new.all_markets }

  it 'displays all markets with links' do
    visit markets_path

    expect(page).to have_content('Markets')
    expect(page).to have_css('table')
    within('table.markets-table') do
      markets.each do |market|
        within("tr#market-#{market.id}") do
          expect(page).to have_content(market.name)
          # expect(page).to have_content(market.city)
          # fails for "Greenwood  Greenwood" because of two spaces rendered as one :(
          expect(page).to have_content(market.state)
          expect(page).to have_button('More Info')
        end
      end
    end

    within('tr#market-322474') do
      click_button('More Info')
      expect(current_path).to eq(market_path(322474))
    end

    visit markets_path
    within('tr#market-322458') do
      click_button('More Info')
      expect(current_path).to eq(market_path(322458))
    end
  end
end
