class LikesController < ApplicationController


    def def new
        @like = Like.new(like_params)
    end
    
    def create 
        @user = current_user.id
        @article = params[:article_id]
        likes = {user_id: @user, article_id: @article}
        @like = Like.new(likes)
        if @like.exits?
            redirect_to article_path(@article)
        else
            @like.save!
            if @like.save 
                redirect_to article_path(@article)
            end

        end
    end

    def self.exists?
        @user = current_user.id
        @article = params[:article_id]
        @like = Like.where(user_id: @user.id, article_id: @article.id)
        if @like
            return true
        else 
            return false
        end
    end

    private
    def like_params
        params.require(:likes).permit(:user_id, :article_id)
    end
end
