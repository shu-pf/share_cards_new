class DownloadsController < ApplicationController
  def index
    @licenses = current_user.licenses
  end

  def show
    licenses = current_user.licenses
    @license = licenses.find(params[:id])
    @card = @license.license_group.card
  end
end
