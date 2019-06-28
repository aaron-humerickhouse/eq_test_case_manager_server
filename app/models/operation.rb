class Operation < ApplicationRecord
  self.table_name = :access_operations
  
  has_many :permissions
  has_many :roles, :through => :permissions

  validates :name, presence: true
  validates :key, presence: true
  validates :description, presence: true

end
