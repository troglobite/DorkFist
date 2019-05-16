module ArticleServices
    class UpdateArticleService

        def initialize(article_params, current_user)
            @params = article_params
            @article = Article.find(article_params[:id])
            @user = User.find(current_user.id)
        end

        def call
            @article = Article.find(article_params[:id])

            if @article.update(article_params)
                redirect_to @article
            else 
                render 'edit'
            end
        end

        private
            def article_params
                @params.require(:article).permit(:title, :text)
            end
    end
end