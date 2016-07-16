class StaticPagesController < ApplicationController
  # static_pageはログアウトさせる
  before_action :log_out
  
  def home
    @title = '概要'
  end
end
