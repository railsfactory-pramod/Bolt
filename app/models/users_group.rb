class UsersGroup < ActiveRecord::Base
  belongs_to :user, :class_name => "Bolt::User"
  belongs_to :group
end

