class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :access_operations do |t|
      t.string :key, null: false
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :access_operations, :key, unique: true
    add_index :access_operations, :name, unique: true
  end
end
