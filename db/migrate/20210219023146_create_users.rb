class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.boolean :admin?
      t.string :phone_number

      t.timestamps
    end
  end
end
