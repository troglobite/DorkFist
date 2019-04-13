class UpdateArticleService

    def initialize(article_params, current_user)
        @article = Article.find(params[:id])
        @user = current_user
    end

    def call
        binding.pry
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else 
            render 'edit'
        end
    end
end