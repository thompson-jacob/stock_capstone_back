class AddViewtypeToUserStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :user_stocks, :view_type, :string
  end
end
