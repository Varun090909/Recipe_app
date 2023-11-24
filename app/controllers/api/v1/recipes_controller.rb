class Api::V1::RecipesController < ApiController
  # protect_from_forgery with: :null_session
  before_action :authenticate_request
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/recipes
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  # GET /api/v1/recipes/:id
  def show
    if @recipe
      render json: @recipe
    else
      render json: {error:"not found"}, status: :not_found
    end
  end

  # POST /api/v1/recipes
  def create
    if current_user
      @recipe = Recipe.create(recipe_params)
      @recipe.user_id = current_user.id

      respond_to do |format|
        if @recipe.save
          format.json { render json: @recipe, status: :created, location: @recipe }
        else
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # GET /api/v1/recipes/:id/edit
  def edit
    render json: @recipe
  end

  # PATCH/PUT /api/v1/recipes/:id
  def update
    if @recipe.user_id == current_user.id
      if @recipe.update(recipe_params)
        render json: @recipe
      else
        render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "You are not authorized to update this recipe." }, status: :unauthorized
    end
  end

  # DELETE /api/v1/recipes/:id
  def destroy
    if @recipe.user_id == current_user.id
      @recipe.destroy
      head :no_content
    else
      render json: { error: "You are not authorized to delete this recipe." }, status: :unauthorized
    end
  end

  private

  
  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.permit(:name, :description, :ingredient, :file)
  end
end