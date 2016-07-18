class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
    
    # ----------------
    # ページネーション
    # ----------------
    @page = params[:page].to_i
    
    # １ページに表示できるユーザ数
    @page_num = 2

    # 全ページ数
    all_page = @users.size / @page_num

    # 全ページ数が10以下なら1から全ページ数までを配列にする
    # 全ページ数が10より大きいならカレントページを中心に10ページ分を配列にする
    if all_page > 10
      first = [1,  @page - 4].max
      first = [first, all_page - 9].min
      last  = [10, @page + 5].max
      last  = [last, all_page].min
      
      @pages = [first..last]
    else
      @pages = [*1..all_page]
    end
    
    # offset: xx番目から
    # limit: xx個分取得する
    @offset_users = @users.order("code ASC")
                          .offset(@page * @page_num)
                          .limit(@page_num)
                          
    # offset後にこの処理を実行
    # 初回アクセスはnilなので、1を入れる
    if params[:page].nil?
      @page = 1
    end
  end

  # ログイン後の画面(プロフィール画面)
  def show
  end
  
  # 編集画面
  def edit
    #@user.user_info = UserInfo.new if @user.user_info.blank?
    # @user.user_info.build unless @user.user_info.present?
    @user.build_user_info unless @user.user_info.present?
  end
  
  # ユーザ情報の変更処理
  def update
    # @user.user_info.user_id = @user.id
    if @user.update(user_info_params)
      # 更新に成功したときの処理
      redirect_to(user_url(@user))
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
    params.require(:user).permit(:code, :email, :password, :password_confirmation, 
                                 user_info_attributes: [:sex, :age, :birthday, :_destroy, :id])
  end
  
  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end
  
  # 正しいユーザーかどうか確認
  def correct_user
    redirect_to(user_path(set_user)) unless set_user == current_user
  end
end
