module ConditionsHelper
  # ログイン中のユーザが使用するデータタイプは設定済みか？
  def exist_user_dkind?
    current_user.dkinds.blank?
  end
end
