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

ActiveRecord::Schema.define(version: 20170707051855) do

  create_table "details", force: :cascade do |t|
    t.text "content"
    t.string "detailable_type"
    t.integer "detailable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detailable_type", "detailable_id"], name: "index_details_on_detailable_type_and_detailable_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "university"
    t.string "major"
    t.string "enrolledtime"
    t.string "gradtime"
    t.string "location"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_educations_on_resume_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "org"
    t.string "desc"
    t.string "starttime"
    t.string "endtime"
    t.string "location"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_experiences_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "resumeid"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selfintros", force: :cascade do |t|
    t.text "content"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_selfintros_on_resume_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_works_on_resume_id"
  end

end