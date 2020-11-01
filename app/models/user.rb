class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :comments

  enum sex: { man: 0, woman: 1}

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :birthday
    validates :gender
  end
end
