class Stock < ApplicationRecord
  has_many :prices
  has_many :users, through: :user_stocks
end
