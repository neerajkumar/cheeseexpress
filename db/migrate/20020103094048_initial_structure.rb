class InitialStructure < ActiveRecord::Migration
  def self.up
    create_table :cheese_libraries do |t|
      t.string :cheese_title
      t.string :description, :limit => 700
      t.string :wine_description, :limit => 700
      t.integer :milk_type_id
      t.integer :cheese_type_id
      t.integer :region_id
      t.datetime :deleted_at
      t.string :cheese_milk
      t.string :average_weight
      t.string :aoc
      t.float :fat_content

      t.timestamps
    end
    
    create_table :users do |t|
      t.string :username
      t.string :password
    end

    create_table :milk_types do |t|
      t.string :milk_type
    end
    
    create_table :cheese_types do |t|
      t.string :cheese_type
    end
    
    create_table :regions do |t|
      t.string :region
    end
    
    create_table :retail_outlets do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :mobile, :limit => 12

      t.timestamps
    end
    
    create_table :recipes do |t|
      t.text :cheese_title
      t.string :wine_description, :limit => 700
      t.string :wine_description_in_french, :limit => 700
      t.integer :number_of_persons_for
      t.float :preperation_time
      t.text :prep_time
      t.float :cooking_time
      t.text :cook_time
      t.string :method, :limit => 700
      t.string :remark, :limit => 700
      t.string :method_in_french, :limit => 700
      t.string :remark_in_french, :limit => 700
      t.text :ingredient
      t.text :ingredient_in_french

      t.timestamps
    end
    
    create_table :events do |t|
      t.text :first_left_content
      t.text :first_left_content_in_french
      t.text :second_left_content
      t.text :second_left_content_in_french
      t.text :first_right_content
      t.text :first_right_content_in_french
      t.text :second_right_content
      t.text :second_right_content_in_french
      t.string :first_image_file_name
      t.string :first_image_content_type
      t.integer :first_image_file_size
      t.string :second_image_file_name
      t.string :second_image_content_type
      t.integer :secong_image_file_size 
      t.string :third_image_file_name
      t.string :third_image_content_type
      t.integer :third_image_file_size
      t.string :fourth_image_file_name
      t.string :fourth_image_content_type
      t.integer :fourth_image_file_size
      t.string :fifth_image_file_name
      t.string :fifth_image_content_type
      t.integer :fifth_image_file_size
      t.string :sixth_image_file_name
      t.string :sixth_image_content_type
      t.integer :sixth_image_file_size
      t.string :seventh_image_file_name
      t.string :seventh_image_content_type
      t.integer :seventh_image_file_size
    end
    
  end

  def self.down
    drop_table :cheese_libraries
    drop_table :users
    drop_table :milk_types
    drop_table :cheese_types
    drop_table :regions
    drop_table :retail_outlets
    drop_table :recipes
    drop_table :events
  end
end
