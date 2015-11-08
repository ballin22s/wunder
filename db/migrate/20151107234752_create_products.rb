class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :release_year
      t.decimal :price, precision: 12, scale: 3
      t.text :description
      t.boolean :active
      
      t.timestamps null: false
    end
  end
end
