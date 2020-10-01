class Card < ApplicationRecord
  has_one_attached :card_img
  has_many :license_groups
  has_many :contents

  validates :title, presence: true
  validates :auther_name, presence: true
end
