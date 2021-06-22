class Movie < ApplicationRecord
  has_many :posts, as: :commentable
end
