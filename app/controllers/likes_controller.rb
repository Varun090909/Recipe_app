class LikesController < ApplicationController
    
      def create
        @like = current_user.likes.new(like_params)
    
        if @like.save
          flash[:notice] = 'Like was successfully created.'
          redirect_to @like.recipe
        else
          flash[:alert] = @like.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path)
        end
      end


      def destroy
        @like = current_user.likes.find(params[:id])
        recipe = @like.recipe
    
        if @like.destroy
          flash[:notice] = 'Like was successfully removed.'
        else
          flash[:alert] = 'Failed to remove the like.'
        end
    
        redirect_to recipe
      end

    
      private
    
      def like_params
        params.require(:like).permit(:recipe_id) # Make sure to permit the recipe_id
      end
    
end 
      
  
    
  
  









