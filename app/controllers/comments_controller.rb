class CommentsController < ApplicationController

    def create
        # @article = Article.find(params[:article_id])
        # @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
        # redirect_to article_path(@article)
        @comment = ::CommentServices::NewCommentService.new(params, current_user).call
        redirect_to article_path(@article)
    end

    def edit
        @article = Article.find(params[:article_id])
        @comment = Article.joins(:comments)
        # @comment = Comment.find_by(id: params[:id], article_id: @article.id)
    end

    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        if @comment.update(comment_params)
            redirect_to @article
        else 
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
