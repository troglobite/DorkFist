class LikesController < ApplicationController

    def create 
        @user = current_user.id
        @article = params[:article_id]
        likes = {user_id: @user, article_id: @article}
        @like = Like.new(likes)
        @like.save!
        if @like.save 
            redirect_to article_path
        end
    end
end
