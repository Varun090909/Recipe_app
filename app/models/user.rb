class User < ApplicationRecord
    after_create :send_admin_mail
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_many :recipes, dependent: :destroy
    has_many :comments
    has_many :likes

  def send_admin_mail
     UserMailer.welcome(self).deliver
  end
end
