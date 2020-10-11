class DownloadMusicsController < ApplicationController
  include Zipline

  def index
    respond_to do |format|
      format.zip {
        license = current_user.licenses.find(params[:download_id])
        card = license.license_group.card
        musics = card.musics
        files = musics.map{ |music| ["#{music.music} - wav", "#{music.title} - #{music.artist_name}.zip"] }
        zipline(files, "#{card.title}.zip")
      }
    end
  end

  def show
    license = current_user.licenses.find(params[:download_id])
    card = license.license_group.card
    @music = card.musics.find(params[:id])
    @file = @music.music
  end
end
