
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    
    if current_user != @recipe.user
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.recipe = @recipe

      if @comment.save
        redirect_to @comment
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:error] = "You cannot comment on your own recipe."
      redirect_to @recipe
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title)
  end
end
