class Book < ApplicationRecord
  has_many :posts, as: :commentable
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :author, presence: true, length: { minimum: 3, maximum: 100 }
  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
