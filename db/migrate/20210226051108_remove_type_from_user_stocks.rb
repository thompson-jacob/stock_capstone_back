class RemoveTypeFromUserStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_stocks, :type, :string
  end
end
