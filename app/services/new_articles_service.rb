class NewArticlesService
    
    def initialize(params)
        @article = article_params
    end

    def call
        article = Article.new(article_params.merge(user_id: current_user.id))
    end
end