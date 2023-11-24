require "rails_helper"
RSpec.describe RecipesController, type: :controller do

  describe 'GET #show' do
    it 'returns a successful response' do
      user = User.create(email: 'test@example.com', password: 'password') # Replace with your User creation code

      # Sign in the user using Devise
      sign_in(user)

      recipe = Recipe.create(name: 'Test Recipe', description: 'Test description', user: user)
      
      get :show, params: { id: recipe.id }
      expect(response).to be_successful
    end
  end

  #this is for create 

  describe "Recipe#create" do
  it "creates a new recipe" do
    user = User.create(email: 'test@example.com', password: 'password')
    sign_in(user)
    expect do
      post :create, params: { recipe: { name: "Test", description: "Description", user_id: user.id } }
    end.to change(Recipe, :count).by(1)
  end

end 

#this is for index

describe "GET #index" do
it "renders the index template" do
  get :index
  expect(response).to render_template("index")
end
#this is for update
describe "Recipe#update" do
  it "updates an existing recipe" do
  
    user = User.create(email: 'test@example.com', password: 'password')
    recipe = Recipe.create(name: "Initial Name", description: "Initial Description", user: user)


    sign_in(user)

    
    updated_attributes = { name: "Updated Name", description: "Updated Description" }

    expect do
    
      put :update, params: { id: recipe.id, recipe: updated_attributes }
    end.to change { recipe.reload.name }.from("Initial Name").to("Updated Name")
    
    
    expect(Recipe.count).to eq(1)
  end
end

end
# this is for destroy
# describe "Recipe#destroy" do
it "destroys an existing recipe" do
  user = User.create(email: 'test@example.com', password: 'password')
  recipe = Recipe.create(name: "Recipe to be destroyed", description: "Recipe to be destroyed description", user: user)


  sign_in(user)

  expect do
    delete :destroy, params: { id: recipe.id }
  end.to change(Recipe, :count).by(-1)

  expect(Recipe.where(id: recipe.id).exists?).to be false
end

#this is for new
describe "Recipe#new" do
  it "displays the new recipe form" do
    user = User.create(email: 'test@example.com', password: 'password')
    sign_in(user)
    get :new
    expect(response).to be_successful
    expect(response).to render_template("new")
  end
end 

# this is for edit
describe "Recipe#edit" do
  it "displays the edit recipe form" do
    user = User.create(email: 'test@example.com', password: 'password')
    recipe = Recipe.create(name: "Recipe to be edited", description: "Recipe to be edited description", user: user)
    sign_in(user)
    get :edit, params: { id: recipe.id }
    expect(response).to be_successful
    expect(response).to render_template("edit")
  end
end


end 
