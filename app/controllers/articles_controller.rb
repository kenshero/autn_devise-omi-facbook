class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index, :new, :destroy]
  def index
    # @articles = Article.all
    @articles = User.select("*").joins(:articles)
  end

  def new
    if current_user.present?
      @article = current_user.articles.build
    else
      @article = Article.new
    end
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private 
  def article_params
    params.require(:article).permit(:name,:detail,:user_id)
  end
end
