module ArticleServices
    class NewArticlesService
        
        def initialize(article_params, current_user)
            @article = article_params[:article]
            @user = current_user
        end

        def call
            @article.permit!
            @article = Article.new(@article.merge(user_id: @user))
            if @article.errors.any?
                puts(@article.errors.count)
                @article.errors.full_messages.each do |error|
                    puts(error)
                end
            end
        end
    end
end