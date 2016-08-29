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

ActiveRecord::Schema.define(version: 20160829165127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.boolean  "is_admin",               default: false, null: false
    t.boolean  "is_active",              default: true,  null: false
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
    t.text     "middle_initial"
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  end

  create_table "kudo_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kudo_transactions", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "amount"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "month"
    t.integer  "year"
    t.text     "reason"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "kudo_categories_id"
    t.index ["from_id"], name: "index_kudo_transactions_on_from_id", using: :btree
    t.index ["kudo_categories_id"], name: "index_kudo_transactions_on_kudo_categories_id", using: :btree
    t.index ["month"], name: "index_kudo_transactions_on_month", using: :btree
    t.index ["to_id"], name: "index_kudo_transactions_on_to_id", using: :btree
    t.index ["year"], name: "index_kudo_transactions_on_year", using: :btree
  end

  add_foreign_key "kudo_transactions", "employees", column: "from_id"
  add_foreign_key "kudo_transactions", "employees", column: "to_id"
end
