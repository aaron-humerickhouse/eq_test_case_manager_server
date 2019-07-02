# frozen_string_literal: true

class AddCompanyIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :company_id, :bigint, null: false

    remove_index :assignments, %i[user_id role_id]
    add_index :assignments, %i[user_id role_id company_id], unique: true
    add_foreign_key :assignments, :companies
  end
end
