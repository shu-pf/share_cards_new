class DownloadMusicsController < ApplicationController
  include Zipline

  def index
    license = current_user.licenses.find(params[:download_id])
    card = license.license_group.card
    @title = card.title
    @files = card.musics.map{ |music| [url_for(music.music), "#{music.track_number}-#{music.title}-#{music.artist_name}.wav"] }
  end

  def mp3_zip
    license = current_user.licenses.find(params[:download_id])
    card = license.license_group.card
    @title = card.title
    @files = card.musics.map{ |music| [url_for(music.music_mp3), "#{music.track_number}-#{music.title}-#{music.artist_name}.mp3"] }
  end

  def flac_zip
    license = current_user.licenses.find(params[:download_id])
    card = license.license_group.card
    @title = card.title
    @files = card.musics.map{ |music| [url_for(music.music_flac), "#{music.track_number}-#{music.title}-#{music.artist_name}.flac"] }
  end

  def show
    license = current_user.licenses.find(params[:download_id])
    card = license.license_group.card
    @music = card.musics.find(params[:id])
    @file = @music.music_mp3
  end
end
