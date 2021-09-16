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

ActiveRecord::Schema.define(version: 2021_09_16_125319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cast_crew_details", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category"], name: "index_categories_on_category", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_departments_on_name", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_type"], name: "index_genres_on_genre_type", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "lang"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lang"], name: "index_languages_on_lang", unique: true
  end

  create_table "movie_casts", force: :cascade do |t|
    t.string "role_name"
    t.bigint "movie_id", null: false
    t.bigint "cast_crew_detail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cast_crew_detail_id"], name: "index_movie_casts_on_cast_crew_detail_id"
    t.index ["movie_id"], name: "index_movie_casts_on_movie_id"
  end

  create_table "movie_crews", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "cast_crew_detail_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cast_crew_detail_id"], name: "index_movie_crews_on_cast_crew_detail_id"
    t.index ["department_id"], name: "index_movie_crews_on_department_id"
    t.index ["movie_id"], name: "index_movie_crews_on_movie_id"
  end

  create_table "movie_details", force: :cascade do |t|
    t.string "runtime"
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_movie_details_on_movie_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.date "release_date"
    t.decimal "rating"
    t.string "trailer_link"
    t.string "description"
    t.string "story_line"
    t.bigint "category_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_movies_on_category_id"
    t.index ["language_id"], name: "index_movies_on_language_id"
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

  create_table "photos", force: :cascade do |t|
    t.string "img_url"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_photos_on_movie_id"
  end

  add_foreign_key "movie_casts", "cast_crew_details"
  add_foreign_key "movie_casts", "movies"
  add_foreign_key "movie_crews", "cast_crew_details"
  add_foreign_key "movie_crews", "departments"
  add_foreign_key "movie_crews", "movies"
  add_foreign_key "movie_details", "movies"
  add_foreign_key "movie_genres", "genres"
  add_foreign_key "movie_genres", "movies"
  add_foreign_key "movies", "categories"
  add_foreign_key "movies", "languages"
end
