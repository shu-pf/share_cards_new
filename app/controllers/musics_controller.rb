class MusicsController < ApplicationController
  def index
    @card = current_user.cards.find(params[:card_id])
    @musics = @card.musics.order(track_number: "ASC")
  end

  def new
    @card = current_user.cards.find(params[:card_id])
    @music = Music.new()
  end

  def create
    @music = Music.new(music_params)
    @music.card_id = params[:card_id]

    @card = current_user.cards.find(params[:card_id])
    musics = @card.musics
    @music.track_number = musics.size + 1
    if @music.save
    else
      render :new
      return
    end

    AudioConversionJob.perform_later(@music.id, params[:card_id])

    # @music.music.open do |file|
    #   audio = FFMPEG::Movie.new(file.path)
    #   audio.transcode(
    #     "tmp/audio-#{@music.id}.mp3",
    #     audio_codec: "libmp3lame",
    #     audio_channels: 2,
    #     audio_bitrate: "320k",
    #     compression_level: "0",
    #     custom: %W(-metadata title=#{@music.title} -metadata album=#{@card.title} -metadata artist=#{@music.artist_name})
    #   )
    #   audio.transcode(
    #     "tmp/audio-#{@music.id}.flac",
    #     audio_codec: "flac",
    #     audio_channels: 2,
    #     custom: %W(-metadata title=#{@music.title} -metadata album=#{@card.title} -metadata artist=#{@music.artist_name})
    #   )

    #   @music.music_mp3.attach(io: File.open("tmp/audio-#{@music.id}.mp3"), filename: 'audio.mp3')
    #   @music.music_flac.attach(io: File.open("tmp/audio-#{@music.id}.flac"), filename: 'audio.flac')
    #   File.delete("tmp/audio-#{@music.id}.mp3")
    #   File.delete("tmp/audio-#{@music.id}.flac")
    # end
    
    redirect_to card_musics_url(@card), notice: "音源が登録されました"
  end

  def moveup
    card = current_user.cards.find(params[:card_id])

    music1 = card.musics.find(params[:music_id])
    if music1.track_number != 1
      music2 = card.musics.find_by(track_number: music1.track_number-1)
      music1.track_number = music1.track_number - 1
      music2.track_number = music2.track_number + 1
      music1.save!
      music2.save!
      # TodoレンダーとかAjaxに変えたいね
      redirect_to card_musics_url(card), notice: "上に移動しました"
    else
      redirect_to card_musics_url(card)
    end
  end

  def movedown
    card = current_user.cards.find(params[:card_id])
    music1 = card.musics.find(params[:music_id])
    if music1.track_number != card.musics.count
      music2 = card.musics.find_by(track_number: music1.track_number+1)
      music1.track_number = music1.track_number + 1
      music2.track_number = music2.track_number - 1
      music1.save!
      music2.save!
      redirect_to card_musics_url(card), notice: "下に移動しました"
    else
      redirect_to card_musics_url(card)
    end
  end

  def music_destroy
    card = current_user.cards.find(params[:card_id])
    music = card.musics.find(params[:music_id])
    musics = card.musics.order(track_number: "DESC")
    if music.track_number != musics.count
      musics.each do |m|
        m.track_number = m.track_number - 1
        m.save!
        break if m.track_number == music.track_number
      end
    end
    music.destroy!
    redirect_to card_musics_url(card)
  end

  private

  def music_params
    params.require(:music).permit(:title, :artist_name, :music)
  end
end
