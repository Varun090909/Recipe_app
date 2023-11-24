class Api::V1::LikesController < ApiController
  def create
    @like = current_user.likes.create(like_params)

    if @like
      render json: { message: 'Like was successfully created.' }, status: :created
    else
      render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find_by(id: params[:id])
    
    if @like
      if @like.destroy
        render json: { message: 'Like was successfully removed.' }
      else
        render json: { error: 'Failed to remove the like.' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Like not found.' }, status: :not_found
    end
  end

  private

  def like_params
    params.permit(:recipe_id) 
  end
end
