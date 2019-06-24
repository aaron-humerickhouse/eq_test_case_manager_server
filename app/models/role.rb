class Role < ApplicationRecord
  self.table_name = :access_roles

  has_many :assignments
  has_many :users, :through => :assignments
  has_many :permissions
  has_many :operations, :through => :permissions
end
