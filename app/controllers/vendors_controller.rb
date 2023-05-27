class VendorsController < ApplicationController
  def show
    @vendor = VendorFacade.new.vendor(vendor_params[:id])
  end

  private

  def vendor_params
    params.permit(:id)
  end
end
