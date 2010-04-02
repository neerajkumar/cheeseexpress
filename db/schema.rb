# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100326204555) do

  create_table "cheese_libraries", :force => true do |t|
    t.string   "cheese_title"
    t.string   "wine_description",           :limit => 700
    t.integer  "milk_type_id"
    t.integer  "cheese_type_id"
    t.integer  "region_id"
    t.datetime "deleted_at"
    t.string   "cheese_milk"
    t.string   "average_weight"
    t.string   "aoc"
    t.float    "fat_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description_in_french",      :limit => 700
    t.string   "wine_description_in_french", :limit => 700
    t.string   "milk_in_french"
    t.string   "cheese_image_file_name"
    t.string   "cheese_image_content_type"
    t.integer  "cheese_image_file_size"
    t.datetime "cheese_image_updated_at"
    t.string   "wine_image_file_name"
    t.string   "wine_image_content_type"
    t.integer  "wine_image_file_size"
    t.datetime "wine_image_updated_at"
    t.string   "maturing_period_in_english"
    t.string   "maturing_period_in_french"
    t.string   "description",                :limit => 1200
  end

  create_table "cheese_types", :force => true do |t|
    t.string "cheese_type"
    t.string "cheese_type_in_french"
  end

  create_table "events", :force => true do |t|
    t.text    "first_left_content"
    t.text    "first_left_content_in_french"
    t.text    "second_left_content"
    t.text    "second_left_content_in_french"
    t.text    "first_right_content"
    t.text    "first_right_content_in_french"
    t.text    "second_right_content"
    t.text    "second_right_content_in_french"
    t.string  "first_image_file_name"
    t.string  "first_image_content_type"
    t.integer "first_image_file_size"
    t.string  "second_image_file_name"
    t.string  "second_image_content_type"
    t.integer "secong_image_file_size"
    t.string  "third_image_file_name"
    t.string  "third_image_content_type"
    t.integer "third_image_file_size"
    t.string  "fourth_image_file_name"
    t.string  "fourth_image_content_type"
    t.integer "fourth_image_file_size"
    t.string  "fifth_image_file_name"
    t.string  "fifth_image_content_type"
    t.integer "fifth_image_file_size"
    t.string  "sixth_image_file_name"
    t.string  "sixth_image_content_type"
    t.integer "sixth_image_file_size"
    t.string  "seventh_image_file_name"
    t.string  "seventh_image_content_type"
    t.integer "seventh_image_file_size"
  end

  create_table "milk_types", :force => true do |t|
    t.string "milk_type"
    t.string "milk_type_in_french"
  end

  create_table "recipes", :force => true do |t|
    t.text     "cheese_title"
    t.string   "wine_description",                :limit => 700
    t.string   "wine_description_in_french",      :limit => 700
    t.integer  "number_of_persons_for"
    t.float    "preperation_time"
    t.text     "prep_time"
    t.float    "cooking_time"
    t.text     "cook_time"
    t.string   "remark",                          :limit => 700
    t.string   "method_in_french",                :limit => 700
    t.string   "remark_in_french",                :limit => 700
    t.text     "ingredient"
    t.text     "ingredient_in_french"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recipecheese_image_file_name"
    t.string   "recipecheese_image_content_type"
    t.integer  "recipecheese_image_file_size"
    t.datetime "recipecheese_image_updated_at"
    t.string   "recipewine_image_file_name"
    t.string   "recipewine_image_content_type"
    t.integer  "recipewine_image_file_size"
    t.datetime "recipewine_image_updated_at"
    t.string   "method",                          :limit => 1200
  end

  create_table "regions", :force => true do |t|
    t.string "region"
  end

  create_table "retail_outlets", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "mobile",     :limit => 12
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "password"
  end

end
