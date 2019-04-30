class LikesController < ApplicationController

    def new
        @like = Like.new(like_params)
    end
    
    def create 
        @user = current_user.id
        @article = params[:article_id]
        likes = {user_id: @user, article_id: @article}
        @like = Like.new(likes)
        if Like.where(user_id: @user, article_id: @article).present?
            redirect_to article_path(@article)
        else
            @like.save!
            if @like.save 
                redirect_to article_path(@article)
            end

        end
    end

    def destroy 
        @like = Like.where(user_id: @user, article_id: @article)
    end

    private
    def like_params
        params.require(:likes).permit(:user_id, :article_id)
    end
end
