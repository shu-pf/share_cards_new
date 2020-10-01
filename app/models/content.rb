class Content < ApplicationRecord
  has_one_attached :content

  validates :content, presence: true
end
