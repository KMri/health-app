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
    # Google Materialize アイコンのハッシュ
    @acordion_icons = {"weight" => "network_check", "fat" => "directions_run" }
    
    # 各データタイプのプルダウンの選択範囲
    @select_menu = [] # ここにメニューの項目を入れる
    @user_dkinds.each do |dkind|
      case dkind.code
        when 'weight'
          @select_menu << create_form_menu(300, 1500, "kg")
        when 'fat'
          @select_menu << create_form_menu(10, 500, "%")
        # @@@ データタイプが増えたらここに追加 @@@
      end
    end
    
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
  
  private
  
  # ドロップダウンメニューの作成
  # ￣￣￣￣￣￣￣￣￣￣￣￣￣￣
  # from(integer): min
  # to(integer):   MAX
  # unit(string):  単位の（kg, %...）
  def create_form_menu(from, to, unit)
    menu_col = (from..to).to_a.map{|num| (num / 10.0).to_s + unit}
    menu_row = (from..to).to_a.map{|num| num / 10.0}
    [menu_col, menu_row].transpose
  end
end
