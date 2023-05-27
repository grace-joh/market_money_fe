class VendorFacade
  def vendor(id)
    Vendor.new(vendor_by(id))
  end

  private

  def vendor_by(id)
    @_vendor_by ||= service.vendor_by(id)[:data]
  end

  def service
    @_service ||= MarketMoneyService.new
  end
end
