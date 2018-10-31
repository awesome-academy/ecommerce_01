class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :total, presence: true,
    numericality: {greater_than_or_equal_to: Settings.order.greater_equal}
  enum status: {processing: 0, accepted: 1, cancelled: 2,
                approved: 3, disapproved: 4}
  enum payment_type: {cash: 0, ATM_Internet_Banking: 1, international_card: 2}
  enum shipper: {vn_post: 0, viettel_post: 1}
end
