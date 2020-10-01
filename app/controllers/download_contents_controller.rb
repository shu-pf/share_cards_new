class DownloadContentsController < ApplicationController
  include Zipline

  def index
    respond_to do |format|
      format.zip {
        licenses = current_user.licenses
        license = licenses.find(params[:download_id])
        card = license.license_group.card
        contents = card.contents
        files = contents.map{ |content| [content.content, content.content.filename.to_s] }
        zipline(files, "#{card.title}contents.zip")
      }
    end
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
