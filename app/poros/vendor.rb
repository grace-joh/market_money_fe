class Vendor < VendorBase
  attr_reader :description,
              :contact_name,
              :contact_phone,
              :credit_accepted

  def initialize(data)
    super(data)
    @description = data[:attributes][:description]
    @contact_name = data[:attributes][:contact_name]
    @contact_phone = data[:attributes][:contact_phone]
    @credit_accepted = data[:attributes][:credit_accepted]
  end
end
