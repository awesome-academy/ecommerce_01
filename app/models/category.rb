class Category < ApplicationRecord
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :sub_categories, class_name: Category.name, foreign_key: :parent_id
  has_many :products
  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.category.name.maximum_length}
  scope :parent_id_null_order_by_id, ->{where("parent_id is null").order("id")}
end
