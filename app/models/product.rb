class Product < ApplicationRecord
  PRICE_REGEX = /\A\d{1,12}\.\d{1,2}\z/
  belongs_to :category
  has_one :order_item
  has_many :rating_user, through: :ratings, source: :user
  has_many :ratings, dependent: :destroy
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :unit, presence: true
  validates :price, presence: true, format: {with: PRICE_REGEX}
  validates :size, presence: true
  validates :color, presence: true
  validates :vendor, presence: true
  validates :unit_in_stock,
    numericality: {only_integer: true,
                   greater_than_or_equal_to: Settings.product.min_unit_in_stock}
  enum size: {no_size: 0, S: 1, M: 2, X: 3, XL: 4, XXL: 5}
  enum color: {no_color: 0, white: 1, black: 2, silver: 3, orange: 4,
               blue: 5, green: 6, red: 7}
  scope :order_by_name, ->{order(:name)}
  scope :list_by_category, (lambda do |category_id|
    where("category_id = ?", category_id)
  end)
  scope :basic_product_info, (lambda do
    select("id, name, description, size, color, price")
  end)
  scope :list_products_by_ids, ->(ids){where("id in (#{ids})")}
  scope :pick_product_by_id, ->(id){where("id = #{id}")}

  def decrease_unit_in_stock product_quantities
    product_quantities.each do |item|
      product = Product.find_by id: item["product_id"].to_i
      product.decrement! :unit_in_stock, item["quantity"].to_i
    end
  end
end
