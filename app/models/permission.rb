class Permission < ApplicationRecord
  self.table_name = :access_permissions
  
  belongs_to :role
  belongs_to :operation
end
