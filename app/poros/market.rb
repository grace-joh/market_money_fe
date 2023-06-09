class Market
  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :zip
  attr_accessor :vendors

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @street = data[:attributes][:street]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @zip = data[:attributes][:zip]
    @vendors = []
  end
end
