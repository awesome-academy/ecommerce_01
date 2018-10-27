class AddIndexToRatings < ActiveRecord::Migration[5.2]
  def change
    add_index :ratings, :rating
    add_index :ratings, [:user_id, :rating]
    add_index :ratings, [:product_id, :rating]
  end
end
