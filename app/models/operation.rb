# frozen_string_literal: true

# Model for Operation
# Granular operations for permissions
class Operation < ApplicationRecord
  has_many :permissions
  has_many :roles, through: :permissions

  validates :name, presence: true
  validates :key, presence: true
  validates :description, presence: true
end
