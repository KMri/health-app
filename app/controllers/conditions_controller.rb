class ConditionsController < ApplicationController
  
  include ConditionsHelper
  
  def new
    # 使用するデータタイプは登録済みかをチェック
    # 未登録であれば、登録画面へ遷移する
    if exist_user_dkind?
      redirect_to(new_user_dkind_path)
    end
    
    @user_dkinds = current_user.dkinds
    @condition = Condition.new
    
    # 各データタイプのプルダウンの選択範囲
    @select_weight = (1..150).to_a
    @select_fat = (1..50).to_a
    
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
