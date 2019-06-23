class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :access_assignments do |t|
      t.references :user, null: false, index: true
      t.references :role, null: false, index: true
    end
    
    add_index :access_assignments, [:user_id, :role_id], unique: true
  end
end
