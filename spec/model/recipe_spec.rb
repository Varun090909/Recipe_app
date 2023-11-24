require "rails_helper"

# frozen_string_literal: true

RSpec.describe Recipe,type: :model do
    it "is valid with a name and an email" do
      user=User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")
      recipe=Recipe.create(name:"pizza",description:"sjdnsdkkk",user_id:user.id)
      cmt = Comment.new(name:"a title",user_id:recipe.user_id,recipe_id:recipe.id)
      expect(cmt).to be_valid
    end
end