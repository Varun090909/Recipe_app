require "rails_helper"

# frozen_string_literal: true

RSpec.describe Comment,type: :model do
    it "is valid with title" do
      user=User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")
      recipe=Recipe.create(name:"pizza",description:"sjdnsdkkk",user_id:user.id)
      cmt = Comment.new(title:"a title",user_id:user.id,recipe_id:recipe.id)
      expect(cmt).to be_valid
    end
    it "belong to user" do
      cmt = Comment.reflect_on_association(:user)
      expect(cmt.macro).to eq(:belongs_to)
    end
    it "belong to recipe" do
      cmt = Comment.reflect_on_association(:recipe)
      expect(cmt.macro).to eq(:belongs_to)
    end

end