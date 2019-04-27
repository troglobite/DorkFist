module CommentServices
    class UpdateCommentService

        def initialize(comment_params)
            @params = comment_params
            @article = Article.find(@params[:article_id])
            @comment = @article.comments.find(@params[:id])
        end

        def call
            @comment.update(comment_params)
        end

    private
        def comment_params
            @params.require(:comment).permit(:commenter, :body)
        end
    end
end