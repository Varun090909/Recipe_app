class Api::V1::CommentsController < ApiController
  before_action :authenticate_request, only: [:create, :destroy]

  # GET /api/v1/comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /api/v1/comments/:id
  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Comment not found' }, status: :not_found
  end

  # POST /api/v1/comments
  def create
    @recipe = Recipe.find_by(id: params[:id])

    if current_user != @recipe.user
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.recipe = @recipe

      if @comment.save
        render json: @comment, status: :created
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'You cannot comment on your own recipe.' }, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters for comment attributes
  def comment_params
    params.permit(:title)
  end
end
