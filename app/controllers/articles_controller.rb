class ArticlesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  # 投稿内容登録
  def create
    article = current_user.articles.build(article_params)
    if article.save
      redirect_to(articles_url, flash: {success: "投稿しました"})
    else
      flash.now[:error] = "失敗しました"
      render 'new'
    end
  end
  
  def show
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title,
                                    :description)
  end
end
