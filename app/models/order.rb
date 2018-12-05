class Order < ApplicationRecord
  after_create :send_accepted_order_email
  ORDER_NAME_REGEX = /\A[^0-9\-\+\*\_\.\@\?\n]+\z/i
  ORDER_PHONE_REGEX = /\A[0-9" "()+]+\z/
  belongs_to :user
  has_many :order_items, dependent: :destroy
  validates_associated :order_items
  validates :order_name, presence: true, format: {with: ORDER_NAME_REGEX},
    length: {minimum: Settings.order.minimum_length.ordername,
             maximum: Settings.order.maximum_length.ordername}
  validates :order_phone, presence: true, format: {with: ORDER_PHONE_REGEX},
    length: {minimum: Settings.order.minimum_length.orderphone,
             maximum: Settings.order.maximum_length.orderphone}
  validates :order_address, presence: true,
    length: {minimum: Settings.order.minimum_length.orderaddress,
             maximum: Settings.order.maximum_length.orderaddress}
  enum status: {processing: 0, accepted: 1, cancelled: 2,
                approved: 3, disapproved: 4}
  enum payment_type: {cash: 0, ATM_Internet_Banking: 1, international_card: 2}
  enum shipper: {vn_post: 0, viettel_post: 1}
  accepts_nested_attributes_for :order_items
  scope :orders_allowed_to_view, ->{where("status NOT IN (0, 4)")}

  def send_accepted_order_email
    OrderMailer.user_order_inform(self).deliver_now
  end
end
