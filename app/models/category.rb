class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.category.name.maximum_length}
end
