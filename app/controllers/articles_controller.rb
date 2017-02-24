class ArticlesController < ApplicationController
  before_action :logged_in?, only: [:create]
  def new
    @article = Article.new
  end
  
  def create
    
  end
  
  def show
  end
end
