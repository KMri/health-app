class UserDkindsController < ApplicationController
  def new
    @user_dkind = UserDkind.new
    @dkinds = Dkind.all
    # フォームのチェックボックスで使用するシンボルの配列
    @dkind_names = [:weight, :fat]
  end

  def show
  end

  def create
    # チェックがONの項目だけ配列に入れる
    use_dkinds = []
    params[:user_dkind].each do |col_name, val|
      next if val == "false"
      use_dkinds << val.to_i
    end
    
    # チェックが全てOFFだった場合は最低１つ選ぶよう、
    # 前の画面へ戻す
    if use_dkinds.empty?
      redirect_to :back
    else
      use_dkinds.each do |dkind_id|
        user_dkind = UserDkind.new
        user_dkind.user_id = current_user.id
        user_dkind.dkind_id = dkind_id
        user_dkind.save
      end
      redirect_to(new_condition_url)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
