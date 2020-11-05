class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :comments
  has_many :favorites
  has_many :posts, through: :favorites

  enum gender: { yet: 0, already: 1 }

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :birthday
    validates :gender
  end
end
