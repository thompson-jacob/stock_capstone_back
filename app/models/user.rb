class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
end
