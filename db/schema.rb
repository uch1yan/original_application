# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_20_015819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "daily_condition_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["daily_condition_id"], name: "index_comments_on_daily_condition_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "daily_conditions", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.integer "mood", null: false
    t.string "temperature"
    t.integer "toilet", null: false
    t.string "sleep", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "kid_id"
    t.index ["kid_id"], name: "index_daily_conditions_on_kid_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_groups_on_family_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "growth_records", force: :cascade do |t|
    t.date "date"
    t.integer "height"
    t.integer "weight"
    t.bigint "kid_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kid_id"], name: "index_growth_records_on_kid_id"
  end

  create_table "kid_vaccination_records", force: :cascade do |t|
    t.integer "count"
    t.date "inplemented_date"
    t.bigint "kid_id", null: false
    t.bigint "vaccination_record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kid_id"], name: "index_kid_vaccination_records_on_kid_id"
    t.index ["vaccination_record_id"], name: "index_kid_vaccination_records_on_vaccination_record_id"
  end

  create_table "kids", force: :cascade do |t|
    t.string "kid_name"
    t.date "date_of_birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_kids_on_family_id"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "date"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.bigint "kid_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kid_id"], name: "index_schedules_on_kid_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "admin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccination_records", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "daily_conditions"
  add_foreign_key "comments", "users"
  add_foreign_key "daily_conditions", "kids"
  add_foreign_key "groups", "families"
  add_foreign_key "groups", "users"
  add_foreign_key "growth_records", "kids"
  add_foreign_key "kid_vaccination_records", "kids"
  add_foreign_key "kid_vaccination_records", "vaccination_records"
  add_foreign_key "kids", "families"
  add_foreign_key "posts", "users"
  add_foreign_key "schedules", "kids"
end
