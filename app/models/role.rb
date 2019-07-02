# frozen_string_literal: true

# Model for Role
# Grouping of operations for permissions
class Role < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
  has_many :permissions
  has_many :operations, through: :permissions

  validates :name, presence: true
  validates :key, presence: true
  validates :description, presence: true
end
