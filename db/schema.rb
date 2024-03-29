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

ActiveRecord::Schema.define(:version => 20110530224421) do

	create_table "admins", :force => true do |t|
		t.string   "username",        :default => "", :null => false
		t.string   "hashed_password", :default => "", :null => false
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "salt",            :default => "", :null => false
	end

	create_table "batimages", :force => true do |t|
		t.boolean  "show"
		t.string   "thumbnail_file_name"
		t.string   "thumbnail_content_type"
		t.integer  "avatar_file_size"
		t.datetime "avatar_updated_at"
		t.datetime "created_at"
		t.datetime "updated_at"
	end
end
