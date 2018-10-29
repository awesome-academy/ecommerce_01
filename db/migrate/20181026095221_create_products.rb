class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :unit
      t.decimal :price, precision: 12, scale: 2
      t.integer :size, null: false, default: 0
      t.integer :color, null: false, default: 0
      t.integer :unit_in_stock
      t.integer :unit_in_order
      t.string :picture
      t.text :vendor
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
