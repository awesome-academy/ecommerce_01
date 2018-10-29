class Product < ApplicationRecord
  PRICE_VND_REGEX = /\A\d{1,12}\z/
  belongs_to :category
  has_one :order_item
  has_many :ratings
  has_many :comments
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true
  validates :unit, presence: true
  validates :price, presence: true, format: {with: PRICE_VND_REGEX}
  validates :size, presence: true
  validates :color, presence: true
  validates :vendor, presence: true
  enum size: {no_size: 0, S: 1, M: 2, X: 3, XL: 4, XXL: 5}
  enum color: {no_color: 0, white: 1, black: 2}
end
