class SessionsController < ApplicationController
  # ログイン画面
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # ユーザーがデータベースにあり、かつ、認証に成功した場合
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in(user)
      redirect_to(user_url(user))
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'IDもしくは、PWが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to(root_url)
  end
end
