class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: {processing: 0, accepted: 1, cancelled: 2,
                approved: 3, disapproved: 4}
  enum payment_type: {cash: 0, ATM_Internet_Banking: 1, international_card: 2}
  enum shipper: {vn_post: 0, viettel_post: 1}

  accepts_nested_attributes_for :order_items
  validates_associated :order_items
end
