class UserDkindsController < ApplicationController
  def new
    @user_dkind = UserDkind.new
    @dkinds = Dkind.all
    # フォームのチェックボックスで使用するシンボルの配列
    # @dkind_names = [:weight, :fat]
  end

  def show
  end

  def create
    create_and_update
  end

  def edit
    @dkinds = Dkind.all
    # オブジェクトに１件レコードが入っていればupdateになるのでOK
    @user_dkind = UserDkind.find_by(user_id: params[:user_id])
  end

  def update
    create_and_update('update')
  end

  def destroy
  end
  
  private
  
  def create_and_update(method_name = nil)
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
      # updateメソッドから来た場合は、削除処理を通す
      if method_name == 'update'
        delete_record
      end
      
      use_dkinds.each do |dkind_id|
        user_dkind = current_user.user_dkinds.build(dkind_id: dkind_id)
        user_dkind.save
      end
      redirect_to(new_condition_url)
    end
  end
  
  # 一旦ユーザに紐付いているレコードを全削除
  def delete_record
    current_user.user_dkinds.destroy_all
  end
end
