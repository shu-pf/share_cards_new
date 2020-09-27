class LicenseGroup < ApplicationRecord
  has_many :licenses
  belongs_to :card
end
