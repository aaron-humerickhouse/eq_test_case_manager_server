# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_27_231624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id", "role_id", "company_id"], name: "index_assignments_on_user_id_and_role_id_and_company_id", unique: true
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "operations", force: :cascade do |t|
    t.string "key", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_operations_on_key", unique: true
    t.index ["name"], name: "index_operations_on_name", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "operation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_permissions_on_operation_id"
    t.index ["role_id", "operation_id"], name: "index_permissions_on_role_id_and_operation_id", unique: true
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "key", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_roles_on_key", unique: true
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "assignments", "companies"
end
