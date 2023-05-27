require 'rails_helper'

RSpec.describe VendorBase do
  it 'can initialize with attributes' do
    vendor_data = {
      id: '55297',
      type: 'vendor',
      attributes: {
        name: 'Orange County Olive Oil',
        description: 'Handcrafted olive oil made from locally grown olives',
        contact_name: 'Syble Hamill',
        contact_phone: '1-276-593-3530',
        credit_accepted: false
      }
    }
    vendor = VendorBase.new(vendor_data)

    expect(vendor).to be_a(VendorBase)
    expect(vendor.id).to eq('55297')
    expect(vendor.name).to eq('Orange County Olive Oil')
  end
end
