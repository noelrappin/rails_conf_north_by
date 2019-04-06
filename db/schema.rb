# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_28_145002) do

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "genre_tags"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_time"
    t.integer "venue_id"
    t.text "genre_tags"
    t.integer "ilk"
    t.integer "access"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["venue_id"], name: "index_concerts_on_venue_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.integer "band_id"
    t.integer "concert_id"
    t.integer "order"
    t.integer "duration_minutes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_gigs_on_band_id"
    t.index ["concert_id"], name: "index_gigs_on_concert_id"
  end

  create_table "ticket_orders", force: :cascade do |t|
    t.integer "gig_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_ticket_orders_on_gig_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "gig_id"
    t.integer "row"
    t.integer "number"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ticket_orders_id"
    t.index ["gig_id"], name: "index_tickets_on_gig_id"
    t.index ["ticket_orders_id"], name: "index_tickets_on_ticket_orders_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "rows"
    t.integer "seats_per_row"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "concerts", "venues"
  add_foreign_key "gigs", "bands"
  add_foreign_key "gigs", "concerts"
  add_foreign_key "ticket_orders", "gigs"
  add_foreign_key "tickets", "gigs"
  add_foreign_key "tickets", "users"
end
