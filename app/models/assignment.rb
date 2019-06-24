class Assignment < ApplicationRecord
  self.table_name = :access_assignments

  belongs_to :user
  belongs_to :role
end
