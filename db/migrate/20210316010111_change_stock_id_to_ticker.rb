class ChangeStockIdToTicker < ActiveRecord::Migration[6.1]
  def change
    add_column :user_stocks, :ticker, :string
  end
end
