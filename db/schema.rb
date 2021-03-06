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

ActiveRecord::Schema.define(version: 20141103075958) do

  create_table "bank_details", force: true do |t|
    t.string   "bsb"
    t.string   "account_number"
    t.string   "account_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billers", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "postcode"
    t.string   "email"
    t.string   "phone"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debtors", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "postcode"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descriptions", force: true do |t|
    t.string "text"
  end

  create_table "invoice_numbers", force: true do |t|
    t.string   "name"
    t.string   "date"
    t.integer  "seq_number"
    t.string   "identifier"
    t.string   "invoice_number"
    t.integer  "invoices_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "date"
    t.string   "invoice_number"
    t.integer  "amount"
    t.integer  "gst"
    t.integer  "description_id"
    t.integer  "item_id"
    t.integer  "debtor_id"
    t.integer  "biller_id"
    t.integer  "bank_detail_id"
    t.integer  "logo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logos", force: true do |t|
    t.string "name"
    t.string "image_id"
    t.string "image_url"
    t.string "image_size"
  end

  create_table "settings", force: true do |t|
    t.string   "bio1"
    t.string   "bio2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_post"
    t.string   "twitter_count"
    t.string   "email_subject"
    t.string   "email_heading"
    t.string   "email_greeting"
    t.string   "email_body"
    t.string   "email_signature"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
