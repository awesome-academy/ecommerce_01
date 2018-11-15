class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :rating, inclusion: {in: 0..5}
  scope :following_product, ->(id){where("product_id = ?", id)}
  scope :following_user, ->(id){where("user_id = ?", id)}
  scope :list_by_rating, ->(rating){where("rating = ?", rating)}
  scope :not_zero_rating, ->{where("rating != 0")}
end
