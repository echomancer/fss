class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.references :producer, index: true
      t.integer :upc
      t.decimal :servings
      t.decimal :serving_size
      t.references :unit, index: true

      t.timestamps
    end
    add_index :foods, [:name, :producer_id, :upc], unique: true
  end
end
