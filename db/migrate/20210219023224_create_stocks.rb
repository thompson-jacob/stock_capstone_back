class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
    
      t.string :ticker
      t.decimal :current_price, precision: 9, scale: 2

      t.timestamps
    end
  end
end
