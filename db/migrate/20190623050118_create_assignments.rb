# frozen_string_literal: true

class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :user, null: false, index: true
      t.references :role, null: false, index: true

      t.timestamps
    end

    add_index :assignments, %i[user_id role_id], unique: true
  end
end
