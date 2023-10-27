class Comment < ApplicationRecord
  validates :title, presence: true
  belongs_to :recipe
  belongs_to :user
end
