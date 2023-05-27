class MarketFacade
  def all_markets
    all_markets_data.map do |market_data|
      Market.new(market_data)
    end
  end

  def market_with_vendors(market_id)
    market = Market.new(market_by_id(market_id))
    market.vendors = vendors_by_market(market_id).map do |vendor_data|
      VendorBase.new(vendor_data)
    end
    market
  end

  private

  def market_by_id(market_id)
    @_market_by_id ||= service.market_by(market_id)[:data]
  end

  def vendors_by_market(market_id)
    @_vendors_by_market ||= service.vendors_by_market(market_id)[:data]
  end

  def all_markets_data
    @_all_markets_data ||= service.all_markets[:data]
  end

  def service
    @_service ||= MarketService.new
  end
end
