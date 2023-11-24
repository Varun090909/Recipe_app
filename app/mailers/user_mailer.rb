class UserMailer < ApplicationMailer

  def welcome(object)
    @object = object

    mail to: @object.email, subject: 'welcome User'
  end
end
