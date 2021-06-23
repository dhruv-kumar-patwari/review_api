class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true, length: { minimum: 6, maximum: 1000 }
end
