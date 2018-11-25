class NewArticleService
    
    def initialize(params)
        @article = params[:id]
    end

    def call
        article = Article.new(article_params.merge(user_id: current_user.id))
    end
end