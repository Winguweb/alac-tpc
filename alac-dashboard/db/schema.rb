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

ActiveRecord::Schema.define(version: 20191007193128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "actors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "general_type"
    t.string "category"
    t.string "subtype"
    t.string "subtype_2"
    t.string "institution"
    t.string "public_branch"
    t.string "position"
    t.string "entity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advisories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "characterization_id"
    t.date "tracking_date"
    t.string "kind_answer"
    t.text "summary"
    t.index ["characterization_id"], name: "index_advisories_on_characterization_id"
  end

  create_table "characterizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "case_id", null: false
    t.text "summary"
    t.string "status"
    t.boolean "known_authority"
    t.string "authority"
    t.boolean "has_tool"
    t.string "tool"
    t.string "scope"
    t.string "kind_corruption"
    t.string "affected_area"
    t.string "affected_sector"
    t.string "rights_violated"
    t.string "kind_responsability"
    t.string "crime"
    t.boolean "have_material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evolutions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "characterization_id"
    t.uuid "actor_id"
    t.date "presentation_date"
    t.date "sanction_date"
    t.string "kind_investigation"
    t.string "stage"
    t.string "situation"
    t.string "fault"
    t.string "authority"
    t.string "crime"
    t.text "details"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_evolutions_on_actor_id"
    t.index ["characterization_id"], name: "index_evolutions_on_characterization_id"
  end

  create_table "relationships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "actor_id"
    t.uuid "characterization_id"
    t.string "participation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id", "characterization_id"], name: "index_relationships_on_actor_id_and_characterization_id", unique: true
    t.index ["actor_id"], name: "index_relationships_on_actor_id"
    t.index ["characterization_id"], name: "index_relationships_on_characterization_id"
  end

  create_table "tools", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "advisory_id"
    t.string "tools_used"
    t.boolean "go_entity"
    t.string "entity"
    t.date "radication_date"
    t.date "deadline"
    t.boolean "have_answer"
    t.date "answer_date"
    t.string "document"
    t.index ["advisory_id"], name: "index_tools_on_advisory_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "advisories", "characterizations"
  add_foreign_key "evolutions", "actors"
  add_foreign_key "evolutions", "characterizations"
  add_foreign_key "relationships", "actors"
  add_foreign_key "relationships", "characterizations"
  add_foreign_key "tools", "advisories"
end
