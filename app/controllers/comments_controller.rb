class CommentsController < ApplicationController

    def create
        @comment = ::CommentServices::NewCommentService.new(params, current_user).call
        redirect_to article_path(params[:article_id])
    end

    def edit
        @article = Article.find(params[:article_id])
        @comment = Article.joins(:comments)
    end

    def update
        @article = Article.find(params[:article_id])
        @comment = ::CommentServices::UpdateCommentService.new(params).call
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = ::CommentServices::DestroyCommentService.new(params).call
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
