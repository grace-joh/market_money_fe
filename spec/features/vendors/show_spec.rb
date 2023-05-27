require 'rails_helper'

RSpec.describe 'Vendor Show Page', :vcr do
  let(:vendor) { VendorFacade.new.vendor(54924) }
  let(:vendor2) { VendorFacade.new.vendor(55297) }

  it 'displays vendor information' do
    visit vendor_path(vendor.id)

    within('header') do
      expect(page).to have_content(vendor.name)
    end

    within('div.vendor-info') do
      expect(page).to have_content('Contact Info')
      expect(page).to have_content("name: #{vendor.contact_name}")
      expect(page).to have_content("phone: #{vendor.contact_phone}")
      expect(page).to have_content('Credit Accepted? YES')
      expect(page).to have_content("Description: #{vendor.description}")
    end
  end

  it 'displays NO if credit is not accepted' do
    visit vendor_path(vendor2.id)
    within('div.vendor-info') do
      expect(page).to have_content('Credit Accepted? NO')
    end
  end
end
