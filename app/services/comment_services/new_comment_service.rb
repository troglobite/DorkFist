module CommentServices
    class NewCommentService

        def initialize(article_id, current_user)
            @article = Article.find(article_id)
            @comments = @article.comments
            @user = User.find(current_user.id)
        end

        def call
            @comment = @comments.create(comment_params.merge(user_id: @user.id))
            redirect_to article_path(@article)
        end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
    end
end