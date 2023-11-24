require "rails_helper"

RSpec.describe Like,type: :model do
  it "is valid with user_id" do
    user=User.create(name: "John Doe", email: "johndoe@example.com",password:"11111111")
    # recipe=Recipe.create(name:"pizza",description:"sjdnsdkkk",user_id:user.id)
    like= Like.new(user_id:user.id,recipe_id:recipe.id)
    expect(like).to be_valid
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