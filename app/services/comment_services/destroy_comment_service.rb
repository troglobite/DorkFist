module CommentServices
    class DestroyCommentService

        def initialize(comment_params)
          @params = comment_params
        end

        def call
            @article = Article.find(@params[:article_id])
            @comment = @article.comments.find(@params[:id])
            @comment.destroy
        end
    end
end