class Contact < ApplicationRecord
  validates :title, presence: true
  validates :email, presence: true
  validates :content, presence: true
end
