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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130722143735) do

  create_table "project_numbers", :force => true do |t|
    t.string   "number",     :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "project_number_id",                                    :default => 0,  :null => false
    t.string   "name",                                                 :default => "", :null => false
    t.string   "unit",                                                 :default => ""
    t.decimal  "contact_count",         :precision => 10, :scale => 0, :default => 0
    t.decimal  "unit_price",            :precision => 10, :scale => 0, :default => 0
    t.decimal  "prior_project_count",   :precision => 10, :scale => 0, :default => 0
    t.decimal  "prior_price",           :precision => 10, :scale => 0, :default => 0
    t.decimal  "current_project_count", :precision => 10, :scale => 0, :default => 0
    t.decimal  "current_price",         :precision => 10, :scale => 0, :default => 0
    t.decimal  "project_count",         :precision => 10, :scale => 0, :default => 0
    t.decimal  "project_price",         :precision => 10, :scale => 0, :default => 0
    t.string   "comment",                                              :default => ""
    t.integer  "publish_status",                                       :default => 1,  :null => false
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
  end

end
