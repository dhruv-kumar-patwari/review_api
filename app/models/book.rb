class Book < ApplicationRecord
  has_many :posts, as: :commentable
end
