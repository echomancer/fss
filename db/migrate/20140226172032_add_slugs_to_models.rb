class AddSlugsToModels < ActiveRecord::Migration
  def change
  	add_column :users, :slug, :string
  	add_index :users, :slug, unique: true
  	add_column :stores, :slug, :string
  	add_index :stores, :slug, unique: true
  	add_column :producers, :slug, :string
  	add_index :producers, :slug, unique: true
  	add_column :units, :slug, :string
  	add_index :units, :slug, unique: true
  	add_column :foods, :slug, :string
  	add_index :foods, :slug, unique: true
  	add_column :stocks, :slug, :string
  	add_index :stocks, :slug, unique: true
  end
end
