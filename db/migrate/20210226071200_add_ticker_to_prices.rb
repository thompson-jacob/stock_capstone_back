class AddTickerToPrices < ActiveRecord::Migration[6.1]
  def change
    add_column :prices, :ticker, :string
  end
end
