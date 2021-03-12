class User < ApplicationRecord
  has_many :stocks, through: :user_stocks
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
