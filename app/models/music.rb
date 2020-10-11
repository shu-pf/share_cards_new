class Music < ApplicationRecord
  has_one_attached :music
  has_one_attached :music_mp3
  has_one_attached :music_flac

  validates :title, presence: true
  validates :music, presence: true, blob: { content_type: ['audio/wav', 'audio/x-wav'] }
  validates :artist_name, presence: true
end
