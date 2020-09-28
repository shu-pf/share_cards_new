class DownloadsController < ApplicationController
  def index
    @licenses = current_user.licenses
  end

  def show
    license = License.find_by(user_id: current_user, id: params[:id])

    file = license.license_group.card.content
    send_data file.download, :filename => file.filename.to_s
  end
end
