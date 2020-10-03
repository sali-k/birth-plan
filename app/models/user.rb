class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :births

  validates :name, presence: true, length: { maximum: 10 }
  validates :introduction, length: { maximum: 200 }
  validates :relationship, length: { maximum: 20 }
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'は@と.を含むアドレスを入力してください' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて、8文字以上で設定してください', on: :create
end
