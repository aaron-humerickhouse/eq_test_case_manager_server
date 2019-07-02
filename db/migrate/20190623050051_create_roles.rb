# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :key, null: false
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :roles, :key, unique: true
    add_index :roles, :name, unique: true
  end
end
