class CommentsController < ApplicationController
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
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to comments_path #index of all recipes 
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  # def edit
  #   @comment = Recipe.find(params[:id])
  # end
  

  # def update
  #   @comment = Recipe.find(params[:id])
  
  #   if @comment.user == current_user
  #     if @comment.update(recipe_params)
  #       redirect_to recipes_path
  #     else
  #       render :edit, status: :unprocessable_entity
  #     end
  #   else
  #     flash[:alert] = "You are not authorized to edit this recipe."
  #     redirect_to @comment
  #   end
  # end
  


  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to comments_path, status: :see_other
    else
      flash[:alert] = "You are not authorized to delete this recipe."
      redirect_to @comment
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:title)
    end

end
