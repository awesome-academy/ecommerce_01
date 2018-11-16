class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  enum rating: {no_rating: 0, one: 1, two: 2, three: 3, four: 4, five: 5}
  scope :following_product, ->(id){where("product_id = ?", id)}
  scope :following_user, ->(id){where("user_id = ?", id)}
  scope :list_by_rating, ->(rating){where("rating = ?", rating)}
end
