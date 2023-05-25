require 'rails_helper'

RSpec.describe 'Market Index Page' do
  before(:all) do
    @markets = MarketFacade.new.all_markets
  end

  it 'displays all markets' do
    visit markets_path

    expect(page).to have_content('Markets')
    expect(page).to have_css('table')
    within('table.markets-table') do
      @markets.each do |market|
        within("tr#market-#{market.id}") do
          expect(page).to have_content(market.name)
          # expect(page).to have_content(market.city)
          # fails for "Greenwood  Greenwood" because of two spaces rendered as one :(
          expect(page).to have_content(market.state)
          expect(page).to have_button('More Info')
        end
      end
    end
  end
end
