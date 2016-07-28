class UserDkind < ActiveRecord::Base
  # DBと紐付かないカラム
  attr_accessor :weight, :fat
  
  belongs_to :user, dependent: :destroy
  belongs_to :dkind, dependent: :destroy
end
