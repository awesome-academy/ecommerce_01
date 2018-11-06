class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true,
    numericality: {greater_than_or_equal_to: Settings.order_item.greater_equal}

  def cal_total product, quantity
    product.price * quantity
  end
end
