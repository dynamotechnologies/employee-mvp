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

ActiveRecord::Schema.define(version: 20160827191017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.boolean  "is_admin",               default: false, null: false
    t.boolean  "is_active",              default: true,  null: false
    t.integer  "kudo_balance",           default: 0,     null: false
    t.integer  "kudos_received",         default: 0,     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_employees_on_username", unique: true, using: :btree
  end

  create_table "kudo_transactions", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "reason"
    t.integer  "month"
    t.integer  "year"
    t.index ["from_id"], name: "index_kudo_transactions_on_from_id", using: :btree
    t.index ["month"], name: "index_kudo_transactions_on_month", using: :btree
    t.index ["to_id"], name: "index_kudo_transactions_on_to_id", using: :btree
    t.index ["year"], name: "index_kudo_transactions_on_year", using: :btree
  end

  add_foreign_key "kudo_transactions", "employees", column: "from_id"
  add_foreign_key "kudo_transactions", "employees", column: "to_id"
end
