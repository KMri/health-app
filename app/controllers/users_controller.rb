class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  # ログイン後の画面(プロフィール画面)
  def show
  end
  
  # 編集画面
  def edit
    #@user.user_info = UserInfo.new if @user.user_info.blank?
    @user.user_info.build unless @user.user_info.present?
  end
  
  # ユーザ情報の変更処理
  def update
    @user.user_info.user_id = @user.id
    if @user.update(user_info_params)
      # 更新に成功したときの処理
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
  end
  
  # ユーザ登録処理
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(user_url(@user))
    else
      render 'new'
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
  
  # Edit（ユーザ更新）のパラメータ
  def user_info_params
    # params.require(:user).permit(:code, :email, :password, :password_confirmation)
    # params.require(:user_info).permit(:seq, :user_id, :sex, :age, :birthday)
    
    params.require(:user).permit(:code, :email, :password, :password_confirmation, 
                                 user_info_attributes: [:sex, :age, :birthday, :_destroy, :id])
  end
end
