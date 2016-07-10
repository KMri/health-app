class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    
  end
  
  # sign up
  def index
    @user = User.new
  end
  
  # ログイン後の画面
  def show
  end
  
  # ユーザ登録処理
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(user_url(@user))
    else
      render 'index'
    end
  
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  # sign_upのパラメータ
  def user_params
    params.require(:user).permit(:code, :email, :password,
                                 :password_confirmation)
  end
end
