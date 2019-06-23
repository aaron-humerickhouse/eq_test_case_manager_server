class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :access_permissions do |t|
      t.references :role, null: false, index: true
      t.references :operation, null: false, index: true
    end
    
    add_index :access_permissions, [:role_id, :operation_id], unique: true
  end
end
