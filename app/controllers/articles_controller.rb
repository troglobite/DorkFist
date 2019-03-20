class ArticlesController < ApplicationController
    before_action :require_valid_user!

    def new 
        @article = Article.new
    end 

    def index
        @article = Article.all
    end
    
    def edit
        @article = Article.find(params[:id])
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        @article = NewArticlesService.new(params, current_user.id).call
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    # def update
    #     @article = EditArticleService.new(params, current_user.id).call
    #     if @article.update
    #         redirect_to @article
    #     else
    #         render 'edit'
    #     end
    # end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else 
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text, :user_id, uploads: [])
        end
end