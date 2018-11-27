require 'pry'

class NewArticlesService
    
    def initialize(article_params, current_user)
        @article = article_params
        @user = current_user
    end

    def call
        binding.pry
        article = Article.new(@article.merge(user_id: @user))
    end
end