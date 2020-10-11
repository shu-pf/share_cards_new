class AudioConversionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @music = Music.find(args[0])
    @card = Card.find(args[1])

    @music.music.open do |file|
      audio = FFMPEG::Movie.new(file.path)
      audio.transcode(
        "tmp/audio-#{@music.id}.mp3",
        audio_codec: "libmp3lame",
        audio_channels: 2,
        audio_bitrate: "320k",
        compression_level: "0",
        custom: %W(-metadata title=#{@music.title} -metadata album=#{@card.title} -metadata artist=#{@music.artist_name})
      )
      audio.transcode(
        "tmp/audio-#{@music.id}.flac",
        audio_codec: "flac",
        audio_channels: 2,
        custom: %W(-metadata title=#{@music.title} -metadata album=#{@card.title} -metadata artist=#{@music.artist_name})
      )

      @music.music_mp3.attach(io: File.open("tmp/audio-#{@music.id}.mp3"), filename: 'audio.mp3')
      @music.music_flac.attach(io: File.open("tmp/audio-#{@music.id}.flac"), filename: 'audio.flac')
      File.delete("tmp/audio-#{@music.id}.mp3")
      File.delete("tmp/audio-#{@music.id}.flac")
    end
  end
end
