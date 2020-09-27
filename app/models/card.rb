class Card < ApplicationRecord
  has_one_attached :content
  has_one_attached :card_img
  has_many :license_groups
end
