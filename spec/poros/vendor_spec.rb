require 'rails_helper'

RSpec.describe Vendor do
  let(:vendor_data) do
    {
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
  end
  let(:vendor) { Vendor.new(vendor_data) }

  it 'inherits from VendorBase' do
    expect(Vendor).to be < (VendorBase)
    expect(vendor.id).to eq('55297')
    expect(vendor.name).to eq('Orange County Olive Oil')
  end

  it 'can initialize with attributes' do
    expect(vendor).to be_a(Vendor)
    expect(vendor.description).to eq('Handcrafted olive oil made from locally grown olives')
    expect(vendor.contact_name).to eq('Syble Hamill')
    expect(vendor.contact_phone).to eq('1-276-593-3530')
    expect(vendor.credit_accepted).to eq(false)
  end
end
