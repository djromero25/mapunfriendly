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

ActiveRecord::Schema.define(version: 20151028205651) do

    create_table "activities", force: :cascade do |t|
        t.integer  "host_id"
        t.string   "name",          limit: 255
        t.text     "description"
        t.string   "type",          limit: 255
        t.date     "date_time"
        t.integer  "max_attendees"
        t.decimal  "cost"
        t.decimal  "latitude"
        t.decimal  "longitude"
        t.datetime "created_at"
        t.datetime "updated_at"
    end

    add_index "activities", ["host_id"], name: "index_activities_on_host_id"

    create_table "attendances", force: :cascade do |t|
        t.integer  "attendee_id"
        t.integer  "attended_activity_id"
        t.datetime "created_at"
        t.datetime "updated_at"
    end

    add_index "attendances", ["attended_activity_id"], name: "index_attendances_on_attended_activity_id"
    add_index "attendances", ["attendee_id"], name: "index_attendances_on_attendee_id"

    create_table "users", force: :cascade do |t|
        t.string   "first_name",      limit: 255
        t.string   "last_name",       limit: 255
        t.string   "email",           limit: 255
        t.string   "username",        limit: 255
        t.date     "birth_date"
        t.string   "picture",         limit: 255
        t.datetime "created_at"
        t.datetime "updated_at"
        t.string   "password_digest"
    end

end
