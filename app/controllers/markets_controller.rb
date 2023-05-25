class MarketsController < ApplicationController
  def index
    @markets = MarketFacade.new.all_markets
  end
end
