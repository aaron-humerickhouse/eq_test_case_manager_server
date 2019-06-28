class AddCompanyIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :access_assignments, :company_id, :bigint, null: false

    remove_index :access_assignments, [:user_id, :role_id]
    add_index :access_assignments, [:user_id, :role_id, :company_id], unique: true
    add_foreign_key :access_assignments, :companies
  end
end
