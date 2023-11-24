require "rails_helper"
RSpec.describe CommentsController, type: :controller do

#this is for index

  describe "GET #index" do
  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
end
#this is for show
describe 'GET #show' do
it 'returns a successful response' do
  user = User.create(email: 'test@example.com', password: 'password') # Replace with your User creation code

  # Sign in the user using Devise
  sign_in(user)

  recipe = Recipe.create(name: 'Test Recipe', description: 'Test description', user: user)
  comment = Comment.create(title: 'Test Recipe', recipe_id:recipe.id , user: user)
  
  get :show, params: { id: comment.id }
  expect(response).to be_successful
end
end
#this is for new
describe "Comment#new" do
  it "displays the new comment form" do
    # Create a user and sign in (you may need to define the sign_in method)
    user = User.create(email: 'test@example.com', password: 'password')
    sign_in(user)
    get :new
    expect(response).to be_successful
    expect(response).to render_template("new")
  end
end
#this is for create





end