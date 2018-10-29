class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  enum rating: {no_rating: 0, one: 1, two: 2, three: 3, four: 4, five: 5}
end
