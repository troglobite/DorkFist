class DestroyArticlesService
    
    def initialize(article_params, current_user)
        @article = Article.find(article_params[:id])
        @user = current_user
    end

    def call 
        # @article = Article.find(article_params[:id])
        @article.uploads.purge
        if @article.destroy
            binding.pry
            redirect_to root_path
        end
    end

end