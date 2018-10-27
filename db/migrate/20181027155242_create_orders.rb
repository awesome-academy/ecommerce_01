class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 20, scale: 2
      t.integer :status, null: false, default: 0
      t.integer :payment_type, null: false, default: 0
      t.integer :shipper, null: false, default: 0
      t.string :order_name
      t.text :order_address
      t.string :order_phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
