class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.decimal :open, precision: 9, scale: 2
      t.decimal :close, precision: 9, scale: 2
      t.decimal :high, precision:9, scale: 2
      t.decimal :low, precision:9, scale: 2
      


    

      t.timestamps
    end
  end
end
