class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :food, index: true
      t.decimal :price
      t.decimal :quantity
      t.references :store, index: true
      t.decimal :discount
      t.datetime :bought
      t.references :user, index: true

      t.timestamps
    end
    add_index :stocks, [:food_id,:store_id,:bought,:user_id], unique: true
  end
end
