require 'pry'

class NewArticlesService
    
    def initialize(article_params, current_user)
        binding.pry
        @article = article_params[:article]
        @user = current_user
    end

    def call
        binding.pry
        @article.permit!
        article = Article.new(@article.merge(user_id: @user))
    end
end