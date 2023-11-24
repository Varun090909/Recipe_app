class HomeController < ApplicationController
  def index
    #  @recipes = Recipe.all 
     @q = Recipe.ransack(params[:q])
     @recipes = @q.result
  end
  def search
    if 
    @query = params[:query]
    @recipe = Recipe.find_by(name: @query)
    redirect_to recipe_path(@recipe)
    else
      puts "not found"
    end
  end
  
end