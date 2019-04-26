module CommentServices
    class NewCommentService

        def initialize(params, current_user)
            @params = params
            @article = Article.find(params[:article_id])
            @comments = @article.comments
            @user = User.find(current_user.id)
        end

        def call
            @comment = @comments.create(comment_params.merge(user_id: @user.id))
        end

    private
        def comment_params
            @params.require(:comment).permit(:commenter, :body)
        end
    end
end