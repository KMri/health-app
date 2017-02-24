class UserDkind < ActiveRecord::Base
  # DBと紐付かないカラム
  attr_accessor :weight, :fat
  
  belongs_to :user
  belongs_to :dkind
  
end
