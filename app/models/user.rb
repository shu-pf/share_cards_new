class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :cards
  has_many :licenses
  validates :username, presence: true

  validate :check_number_of_creator

  def check_number_of_creator
    if creator?
      puts User.where(creator: true).count
      if User.where(creator: true).count > 59
        errors.add(:base ,"現在60人以上のカード制作用アカウント新規の受付はしていません")
      end
    end
  end
end
