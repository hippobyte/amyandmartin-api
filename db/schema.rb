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

ActiveRecord::Schema.define(version: 2021_03_10_235550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_contacts", id: :text, force: :cascade do |t|
    t.text "guest_id"
    t.text "email"
    t.text "phone"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guests", id: :text, force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "guest_name"
    t.integer "wave"
    t.integer "children_count", default: 0
    t.integer "guest_count", default: 0
    t.jsonb "options"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rsvps", id: :text, force: :cascade do |t|
    t.text "guest_id"
    t.text "invite_code"
    t.text "status"
    t.integer "guest_count", default: 0
    t.integer "children_count", default: 0
    t.jsonb "options"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "partner_status"
    t.text "child_status"
    t.text "dietary_restrictions"
    t.index ["guest_id"], name: "index_rsvps_on_guest_id"
    t.index ["invite_code"], name: "index_rsvps_on_invite_code"
    t.index ["status"], name: "index_rsvps_on_status"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "item_id"
    t.text "user_ip"
    t.text "user_agent"
  end

end
