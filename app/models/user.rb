class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name,   presence: true
  validates :birthday, presence: true

  #半角英小文字大文字数字をそれぞれ1種類以上含む6文字以上の正規表現
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{6,}+\z/.freeze
  
  validates_format_of :password, with: PASSWORD_REGEX
  
  with_options presence: true, format: { with: /\A[一-龥]+\z/ } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end


end
