class AddStockIdToPrice < ActiveRecord::Migration[6.1]
  def change
    add_column :prices, :stock_id, :integer
  end
end
