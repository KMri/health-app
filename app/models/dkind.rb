class Dkind < ActiveRecord::Base
  has_many :users, through: :user_dkinds
end
