class Assignment < ApplicationRecord
  self.table_name = :access_assignments

  belongs_to :user
  belongs_to :role
  belongs_to :company

  validates :user, presence: true
  validates :role, presence: true
  validates :company, presence: true
end
