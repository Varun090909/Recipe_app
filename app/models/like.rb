class Like < ApplicationRecord
  validates :user_id, uniqueness: {scope: :recipe_id} # model level validation 
  belongs_to :user
  belongs_to :recipe
end
