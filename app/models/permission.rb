# frozen_string_literal: true

# Model for Permission
# Joins role and operation
class Permission < ApplicationRecord
  belongs_to :role
  belongs_to :operation

  validates :role, presence: true
  validates :operation, presence: true
end
