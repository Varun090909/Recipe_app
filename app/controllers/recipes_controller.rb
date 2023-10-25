class RecipesController < ApplicationController

    def index
      @recipes = Recipe.all
    end
  
    def show
      @recipe = Recipe.find(params[:id])
    end
  
    def new
      @recipe = Recipe.new
    end
  
    def create
      @recipe = current_user.recipes.build(recipe_params)
  
      if @recipe.save
        redirect_to recipes_path #index of all recipes 
      else
        render :new, status: :unprocessable_entity
      end
    end
    
  
    def edit
      @recipe = Recipe.find(params[:id])
    end
    

    def update
      @recipe = Recipe.find(params[:id])
    
      if @recipe.user == current_user
        if @recipe.update(recipe_params)
          redirect_to recipes_path
        else
          render :edit, status: :unprocessable_entity
        end
      else
        flash[:alert] = "You are not authorized to edit this recipe."
        redirect_to @recipe
      end
    end
    
  

    def destroy
      @recipe = Recipe.find(params[:id])
      if @recipe.user == current_user
        @recipe.destroy
        redirect_to recipes_path, status: :see_other
      else
        flash[:alert] = "You are not authorized to delete this recipe."
        redirect_to @recipe
      end
    end


    private
      def recipe_params
        params.require(:recipe).permit(:name, :description)
      end
  
end
