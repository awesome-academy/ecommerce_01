class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity, default: 1
      t.decimal :price, precision: 12, scale: 2
      t.string :size
      t.string :color
      t.decimal :total, precision: 15, scale: 2
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
