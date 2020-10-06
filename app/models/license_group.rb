class LicenseGroup < ApplicationRecord
  has_many :licenses, dependent: :destroy
  belongs_to :card

  validates :number_of_licenses, presence: true
end
