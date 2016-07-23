class UserDkind < ActiveRecord::Base
  belongs_to :user
  belongs_to :dkind
end
