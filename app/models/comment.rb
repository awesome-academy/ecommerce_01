class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :content, presence: true,
    length: {minimum: Settings.comment.content.min,
             maximum: Settings.comment.content.max}
end
