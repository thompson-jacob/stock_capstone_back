class UserStock < ApplicationRecord
  belongs_to :stock, optional: true
  belongs_to :user
end
