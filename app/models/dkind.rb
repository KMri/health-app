class Dkind < ActiveRecord::Base
  has_many :user_dkinds
  has_many :users, through: :user_dkinds
  
  # ユーザがDkindのデータを持っているかどうか
  def is_check?(current_user)
    check = false
    self.users.each do |user|
      if user.id == current_user.id
        check = true
        break # 一致したら抜ける
      else
        check = false
      end
    end
    return check
  end
end

  # def is_check?(current_user)
  #   self.users.each do |user|
  #     if user.id == current_user.id
  #       true
  #     else
  #       false
  #     end
  #   end
  # end
  
  # def is_check?(current_user)
  #   check = true
  #   self.users.each do |user|
  #     if user.id == current_user.id
  #       check = true
  #     else
  #       check = false
  #     end
  #   end
  #   return check
  # end