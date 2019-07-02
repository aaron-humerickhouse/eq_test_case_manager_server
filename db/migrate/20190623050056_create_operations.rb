# frozen_string_literal: true

class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.string :key, null: false
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :operations, :key, unique: true
    add_index :operations, :name, unique: true
  end
end
