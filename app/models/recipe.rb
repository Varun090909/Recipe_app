class Recipe < ApplicationRecord
  # validates :name, :description, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :file, dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    %w(name)
  end
 
end
