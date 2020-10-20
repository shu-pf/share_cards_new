class DownloadMusicsController < ApplicationController
  include Zipline

  def index
    respond_to do |format|
      format.zip {
        license = current_user.licenses.find(params[:download_id])
        card = license.license_group.card
        musics = card.musics
        files = musics.map{ |music| [music.music, "#{music.title} - #{music.artist_name}.wav"] }
        zipline(files, "#{card.title}-wav.zip")
      }
    end
  end

  def mp3_zip
    respond_to do |format|
      format.zip {
        license = current_user.licenses.find(params[:download_id])
        card = license.license_group.card
        musics = card.musics
        files = musics.map{ |music| [music.music_mp3, "#{music.title} - #{music.artist_name}.mp3"] }
        zipline(files, "#{card.title}-mp3.zip")
      }
    end
  end

  def flac_zip
    respond_to do |format|
      format.zip {
        license = current_user.licenses.find(params[:download_id])
        card = license.license_group.card
        musics = card.musics
        files = musics.map{ |music| [music.music_flac, "#{music.title} - #{music.artist_name}.flac"] }
        zipline(files, "#{card.title}-flac.zip")
      }
    end
  end

  def show
    license = current_user.licenses.find(params[:download_id])
    card = license.license_group.card
    @music = card.musics.find(params[:id])
    @file = @music.music_flac
  end
end
