class MarketMoneyService
  def all_markets
    get_url('api/v0/markets')
  end

  def market_by(id)
    get_url("api/v0/markets/#{id}")
  end

  def vendors_by_market(id)
    get_url("api/v0/markets/#{id}/vendors")
  end

  def vendor_by(id)
    get_url("api/v0/vendors/#{id}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:3000/') do |faraday|
      faraday.headers = { 'Content-Type' => 'application/json' }
    end
  end
end
