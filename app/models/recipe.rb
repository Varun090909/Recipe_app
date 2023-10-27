class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes 
  has_one_attached :file, dependent: :destroy
end
