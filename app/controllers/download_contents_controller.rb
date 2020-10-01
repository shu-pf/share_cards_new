class DownloadContentsController < ApplicationController
  def download_contents

  end

  def show
    licenses = current_user.licenses
    license = licenses.find(params[:download_id])
    card = license.license_group.card
    content = card.contents.find(params[:id])
    file = content.content
    send_data file.download, :filename => file.filename.to_s
  end
end
