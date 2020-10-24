class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :cards
  has_many :licenses
  validates :username, presence: true

  validate :check_number_of_creator

  # フォームで悪意のある送り方をされた場合
  def check_number_of_creator
    if creator?
      errors.add(:base ,"現在プレリリース期間の為カード制作用アカウントの作成は、お問い合わせより承っております。")
    end
  end
end
