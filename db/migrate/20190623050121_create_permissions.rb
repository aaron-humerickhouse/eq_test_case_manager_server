# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.references :role, null: false, index: true
      t.references :operation, null: false, index: true

      t.timestamps
    end

    add_index :permissions, %i[role_id operation_id], unique: true
  end
end
