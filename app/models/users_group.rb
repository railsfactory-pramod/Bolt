class UsersGroup < ActiveRecord::Base
  belongs_to :user, :class_name => "Bolt::User"
  belongs_to :group
  validates_uniqueness_of :user_id, :scope => [:group_id]
end

