class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :products
  validates :body, presence: true
end
