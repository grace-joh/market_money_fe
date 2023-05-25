class MarketFacade
  def all_markets
    all_markets_data.map do |market_data|
      Market.new(market_data)
    end
  end

  private

  def all_markets_data
    @_all_markets_data ||= service.all_markets[:data]
  end

  def service
    @_service ||= MarketService.new
  end
end
