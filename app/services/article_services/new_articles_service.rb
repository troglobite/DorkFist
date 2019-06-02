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
                controller.flash[:success] = 'Your article has been posted'
            else
                controller.flash[:alert] = 'There was an issue saving your article'
                render :new
            end
        end
    end
end