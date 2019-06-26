module ArticleServices
    class UpdateArticleService

        def initialize(params, current_user)
            @params = params
            @article = Article.find(@params[:id])
            @user = User.find(current_user)
        end

        def call
            @article.update(article_params)
        end

        private
            def article_params
                @params.require(:article).permit(:title, :text)
            end
    end
end