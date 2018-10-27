class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :products, [:category_id, :name, :size, :price]
    add_index :products, [:name, :size, :price, :color]
  end
end
