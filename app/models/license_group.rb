class LicenseGroup < ApplicationRecord
  has_many :licenses, dependent: :destroy
  belongs_to :card

  validates :number_of_licenses, presence: true, numericality: {only_integer: true, less_than: 10000}
end
