module ArticleServices
    class DestroyArticlesService
        
        def initialize(article_params, current_user)
            @article = Article.find(article_params[:id])
            @user = current_user
        end

        def call 
            @article.uploads.purge
            @article.destroy
        end

    end
end