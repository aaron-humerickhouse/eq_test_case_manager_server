# frozen_string_literal: true

# Joins model between user, role, and company
class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :company

  validates :user, presence: true
  validates :role, presence: true
  validates :company, presence: true
end
