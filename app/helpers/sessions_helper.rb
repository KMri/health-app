module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ログインしてなければログイン画面へ
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end
  
  # 現在ログインしているユーザーを返す (ユーザーがログイン中の場合のみ)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # @current_user = @current_user || User.find_by(id: session[:user_id])と同じ
    # nilだったらuserを検索して代入
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  # logout処理。nilにする。
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Editのページであればtrueを返す
  def edit_page?(mode)
    if "edit" == mode
      true
    else
      false
    end
  end
end
