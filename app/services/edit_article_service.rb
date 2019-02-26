class EditArticleService
    def initialize(article_params, current_user)
        @article = Article.find(params[:id])
        @user = current_user
    end

    def call 
        article = Article.update(article_params)
    end
end