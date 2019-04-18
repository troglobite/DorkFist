module ArticleServices
    class NewArticlesService
        
        def initialize(article_params, current_user)
            @article = article_params[:article]
            @user = current_user
        end

        def call
            @article.permit!
            @article = Article.new(@article.merge(user_id: @user))
            if @article.save
                binding.pry
                redirect_to @article
            else
                render :new
            end
        end
    end
end