# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150721130452) do

  create_table "Portfolio_brand_list", force: :cascade do |t|
    t.string "Brand", limit: 50, null: false
    t.string "Label", limit: 50, null: false
  end

  create_table "Portfolio_client", force: :cascade do |t|
    t.string  "Name",                 limit: 50,  null: false
    t.string  "Contact_Email",        limit: 75,  null: false
    t.integer "Contact_Phone",        limit: 4,   null: false
    t.string  "Contact_Address",      limit: 255, null: false
    t.string  "Industry",             limit: 50,  null: false
    t.integer "Project_Client_ID_id", limit: 4
  end

  add_index "portfolio_client", ["Project_Client_ID_id"], name: "Portfolio_client_38332ef8", using: :btree

  create_table "Portfolio_colour_list", force: :cascade do |t|
    t.string "Colour", limit: 50, null: false
    t.string "Label",  limit: 50, null: false
  end

  create_table "Portfolio_library", force: :cascade do |t|
    t.string "Name",       limit: 50,  null: false
    t.string "Type",       limit: 50,  null: false
    t.string "SourceCode", limit: 200, null: false
  end

  create_table "Portfolio_partner", force: :cascade do |t|
    t.string  "Name",                  limit: 50,  null: false
    t.string  "Contact_Email",         limit: 75,  null: false
    t.integer "Contact_Phone",         limit: 4,   null: false
    t.string  "Contact_Address",       limit: 255, null: false
    t.string  "Type",                  limit: 50,  null: false
    t.integer "Project_Partner_ID_id", limit: 4
    t.string  "Salary",                limit: 255, null: false
  end

  add_index "portfolio_partner", ["Project_Partner_ID_id"], name: "Portfolio_partner_c58e6359", using: :btree

  create_table "Portfolio_project", force: :cascade do |t|
    t.string  "Name",                  limit: 50,  null: false
    t.string  "Description",           limit: 255, null: false
    t.string  "Type",                  limit: 50,  null: false
    t.string  "SourceCode",            limit: 200, null: false
    t.string  "Design_Doc",            limit: 100, null: false
    t.date    "Time",                              null: false
    t.integer "Project_Client_ID_id",  limit: 4
    t.integer "Project_Partner_ID_id", limit: 4
  end

  add_index "portfolio_project", ["Project_Client_ID_id"], name: "Portfolio_project_38332ef8", using: :btree
  add_index "portfolio_project", ["Project_Partner_ID_id"], name: "Portfolio_project_c58e6359", using: :btree

  create_table "Portfolio_project_client", force: :cascade do |t|
    t.integer "Project_ID_id", limit: 4
    t.integer "Client_ID_id",  limit: 4
  end

  add_index "portfolio_project_client", ["Client_ID_id"], name: "Portfolio_project_client_7ff857da", using: :btree
  add_index "portfolio_project_client", ["Project_ID_id"], name: "Portfolio_project_client_01bf33d5", using: :btree

  create_table "Portfolio_project_partner", force: :cascade do |t|
    t.integer "Project_ID_id", limit: 4
    t.integer "Partner_ID_id", limit: 4
  end

  add_index "portfolio_project_partner", ["Partner_ID_id"], name: "Portfolio_project_partner_76ea08d3", using: :btree
  add_index "portfolio_project_partner", ["Project_ID_id"], name: "Portfolio_project_partner_01bf33d5", using: :btree

  create_table "Portfolio_shoes", force: :cascade do |t|
    t.string "Name",        limit: 50,  null: false
    t.string "Description", limit: 255, null: false
    t.string "Type",        limit: 50,  null: false
    t.string "Brand",       limit: 50,  null: false
    t.string "Gender",      limit: 50,  null: false
    t.string "Shoes_Photo", limit: 200, null: false
    t.string "Colour",      limit: 50,  null: false
    t.date   "Time",                    null: false
  end

  create_table "Portfolio_type_list", force: :cascade do |t|
    t.string "Type",  limit: 50, null: false
    t.string "Label", limit: 50, null: false
  end

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
  end

  add_index "auth_group", ["name"], name: "name", unique: true, using: :btree

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      limit: 4, null: false
    t.integer "permission_id", limit: 4, null: false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], name: "group_id", unique: true, using: :btree
  add_index "auth_group_permissions", ["group_id"], name: "auth_group_permissions_5f412f9a", using: :btree
  add_index "auth_group_permissions", ["permission_id"], name: "auth_group_permissions_83d7f98b", using: :btree

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id", limit: 4,   null: false
    t.string  "codename",        limit: 100, null: false
  end

  add_index "auth_permission", ["content_type_id", "codename"], name: "content_type_id", unique: true, using: :btree
  add_index "auth_permission", ["content_type_id"], name: "auth_permission_37ef4eb4", using: :btree

  create_table "auth_user", force: :cascade do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login",               null: false
    t.boolean  "is_superuser", limit: 1,   null: false
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 75,  null: false
    t.boolean  "is_staff",     limit: 1,   null: false
    t.boolean  "is_active",    limit: 1,   null: false
    t.datetime "date_joined",              null: false
  end

  add_index "auth_user", ["username"], name: "username", unique: true, using: :btree

  create_table "auth_user_groups", force: :cascade do |t|
    t.integer "user_id",  limit: 4, null: false
    t.integer "group_id", limit: 4, null: false
  end

  add_index "auth_user_groups", ["group_id"], name: "auth_user_groups_5f412f9a", using: :btree
  add_index "auth_user_groups", ["user_id", "group_id"], name: "user_id", unique: true, using: :btree
  add_index "auth_user_groups", ["user_id"], name: "auth_user_groups_6340c63c", using: :btree

  create_table "auth_user_user_permissions", force: :cascade do |t|
    t.integer "user_id",       limit: 4, null: false
    t.integer "permission_id", limit: 4, null: false
  end

  add_index "auth_user_user_permissions", ["permission_id"], name: "auth_user_user_permissions_83d7f98b", using: :btree
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], name: "user_id", unique: true, using: :btree
  add_index "auth_user_user_permissions", ["user_id"], name: "auth_user_user_permissions_6340c63c", using: :btree

  create_table "brand_lists", force: :cascade do |t|
    t.string   "brand",      limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "colour_lists", force: :cascade do |t|
    t.string   "color",      limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "data_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                        null: false
    t.integer  "user_id",         limit: 4,          null: false
    t.integer  "content_type_id", limit: 4
    t.text     "object_id",       limit: 4294967295
    t.string   "object_repr",     limit: 200,        null: false
    t.integer  "action_flag",     limit: 2,          null: false
    t.text     "change_message",  limit: 4294967295, null: false
  end

  add_index "django_admin_log", ["content_type_id"], name: "django_admin_log_37ef4eb4", using: :btree
  add_index "django_admin_log", ["user_id"], name: "django_admin_log_6340c63c", using: :btree

  create_table "django_content_type", force: :cascade do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
  end

  add_index "django_content_type", ["app_label", "model"], name: "app_label", unique: true, using: :btree

  create_table "django_session", primary_key: "session_key", force: :cascade do |t|
    t.text     "session_data", limit: 4294967295, null: false
    t.datetime "expire_date",                     null: false
  end

  add_index "django_session", ["expire_date"], name: "django_session_b7b81f0c", using: :btree

  create_table "django_site", force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "shoes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "type",        limit: 255
    t.string   "brand",       limit: 255
    t.string   "gender",      limit: 255
    t.string   "colour",      limit: 255
    t.date     "time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sneaker_data", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "sneakertype", limit: 255
    t.string   "brand",       limit: 255
    t.string   "gender",      limit: 255
    t.string   "colour",      limit: 255
    t.date     "time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sneakertype_lists", force: :cascade do |t|
    t.string   "sneakertype", limit: 255
    t.string   "label",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "Portfolio_client", "Portfolio_project_client", column: "Project_Client_ID_id", name: "Project_Client_ID_id_refs_id_aa82af4a"
  add_foreign_key "Portfolio_partner", "Portfolio_project_partner", column: "Project_Partner_ID_id", name: "Project_Partner_ID_id_refs_id_e4c75d4b"
  add_foreign_key "Portfolio_project", "Portfolio_project_client", column: "Project_Client_ID_id", name: "Project_Client_ID_id_refs_id_6ef91edd"
  add_foreign_key "Portfolio_project", "Portfolio_project_partner", column: "Project_Partner_ID_id", name: "Project_Partner_ID_id_refs_id_8a453873"
  add_foreign_key "Portfolio_project_client", "Portfolio_client", column: "Client_ID_id", name: "Client_ID_id_refs_id_d44c3aab"
  add_foreign_key "Portfolio_project_client", "Portfolio_project", column: "Project_ID_id", name: "Project_ID_id_refs_id_a3e28b70"
  add_foreign_key "Portfolio_project_partner", "Portfolio_partner", column: "Partner_ID_id", name: "Partner_ID_id_refs_id_88bdcd4b"
  add_foreign_key "Portfolio_project_partner", "Portfolio_project", column: "Project_ID_id", name: "Project_ID_id_refs_id_971e3d16"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "group_id_refs_id_f4b32aac"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "permission_id_refs_id_6ba0f519"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_d043b34a"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "group_id_refs_id_274b862c"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "user_id_refs_id_40c41112"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "permission_id_refs_id_35d9ac25"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "user_id_refs_id_4dc23c39"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "user_id_refs_id_c0d12874"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_93d2d1f8"
end
