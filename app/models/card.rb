class Card < ApplicationRecord
  has_one_attached :card_img
  has_many :license_groups, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :musics, dependent: :destroy

  validates :title, presence: true
  validates :format, presence: true
  validates :auther_name, presence: true
end
