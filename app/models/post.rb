class Post < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { minimum: 6, maximum: 1000 }
end
