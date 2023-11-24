require 'rails_helper'

RSpec.describe Api::V1::RecipesController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:recipe) { Recipe.create(name: 'Chocolate Cake', description: 'Delicious dessert', ingredient: 'Sugar, Flour, Cocoa Powder', user_id: user.id) }

  describe 'GET #index' do
    it 'renders index in JSON' do
      request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response for an existing recipe' do
      request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
      get :show, params: { id: recipe.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns not found for a non-existent recipe' do
      request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
      get :show, params: { id: -1 }
      expect(response).to have_http_status(:not_found)
    end
  end

  # describe 'POST #create' do
  #   it 'creates a new recipe' do
  #     request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
  #     expect do
  #       post :create, params: { recipe: { name: 'New Recipe', description: 'Description', ingredient: 'Ingredient' } }
  #     end.to change(Recipe, :count).by(1)
  #   end
  # end

  # describe 'PATCH #update' do
  #   it 'updates the recipe' do
  #     request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
  #     patch :update, params: { recipe: { name: 'Updated Recipe', description: 'Updated Description', ingredient: 'Updated Ingredient' }, id: recipe.id }
  #     expect(response).to have_http_status(:found)
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'destroys the recipe' do
  #     request.headers['Authorization'] = "Bearer #{AuthenticationService.encode_token(user.id)}"
  #     expect do
  #       delete :destroy, params: { id: recipe.id }
  #     end.to change(Recipe, :count).by(-1)
  #   end
  # end
end
