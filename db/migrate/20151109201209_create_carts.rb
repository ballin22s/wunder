class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.decimal :subtotal, precision: 12, scale: 3

      t.timestamps null: false
    end
    add_index :carts, :user_id 
  end
end
