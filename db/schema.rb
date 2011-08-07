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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110807044514) do

  create_table "games", :force => true do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "venue_id"
    t.integer  "sport_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_event_id"
  end

  create_table "master_events", :force => true do |t|
    t.time     "time"
    t.date     "date"
    t.integer  "sport_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "participants", :force => true do |t|
    t.integer  "master_event_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "sport_id"
    t.text     "description"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "url"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "data_source_id"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_event_id"
  end

end
