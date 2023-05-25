class MarketService
  def all_markets
    get_url('api/v0/markets')
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
