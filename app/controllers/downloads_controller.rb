class DownloadsController < ApplicationController
  def index
    @licenses = current_user.licenses
  end

  def show
    licenses = current_user.licenses
    @license = licenses.find(params[:id])
    @card = @license.license_group.card
  end

  def destroy
    licenses = current_user.licenses
    license = licenses.find(params[:id])
    license.update(user_id: nil)
    redirect_to downloads_url, notice: "登録を解除しました。"
  end
end
