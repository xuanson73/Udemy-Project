class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    
    def show
    end

    def new
        @article= Article.new
    end

    def edit
    end

    def create
        if @article.save
            flash[:notice]= "article was successfully created"
            redirect_to @article
        else 
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice]= "article was successfully updated"
         redirect_to @article
        else
            render 'edit'  
        end
            
    end

    def destroy
        @article.destroy
        flash[:notice]= "article was successfully destroyed"
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end