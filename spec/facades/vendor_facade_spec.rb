require 'rails_helper'

RSpec.describe VendorFacade, :vcr do
  before(:all) do
    @facade = VendorFacade.new
  end

  describe 'vendor(id)' do
    it 'returns a Vendor object' do
      vendor = @facade.vendor(55297)
      expect(vendor).to be_a(Vendor)
      expect(vendor.id).to eq('55297')
      expect(vendor.name).to eq('Orange County Olive Oil')
      expect(vendor.description).to eq('Handcrafted olive oil made from locally grown olives')
      expect(vendor.contact_name).to eq('Syble Hamill')
      expect(vendor.contact_phone).to eq('1-276-593-3530')
      expect(vendor.credit_accepted).to eq(false)
    end
  end
end
