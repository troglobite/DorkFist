class NewArticlesService
    
    def initialize(article_params, current_user)
        @article = article_params[:article]
        @user = current_user
    end

    def call
        @article.permit!
        article = Article.new(@article.merge(user_id: @user))
    end
end