class Post < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
