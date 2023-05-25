class MarketsController < ApplicationController
  def index
    @markets = MarketFacade.new.all_markets
  end

  def show
    @market = MarketFacade.new.market_with_vendors(params[:id])
  end
end
