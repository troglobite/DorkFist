module ArticleServices
    class UpdateArticleService

        def initialize(article_params, current_user)
            @article = Article.find(article_params[:id])
            @user = current_user
        end

        def call
            @article = Article.find(article_params[:id])

            if @article.update(article_params)
                redirect_to @article
            else 
                render 'edit'
            end
        end
    end
end