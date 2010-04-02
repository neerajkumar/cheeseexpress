class AddAttachmentsCheeseImageAndWineImageToCheeseLibrary < ActiveRecord::Migration
  def self.up

    add_column :cheese_libraries, :cheese_image_file_name, :string
    add_column :cheese_libraries, :cheese_image_content_type, :string
    add_column :cheese_libraries, :cheese_image_file_size, :integer
    add_column :cheese_libraries, :cheese_image_updated_at, :datetime

    add_column :cheese_libraries, :wine_image_file_name, :string
    add_column :cheese_libraries, :wine_image_content_type, :string
    add_column :cheese_libraries, :wine_image_file_size, :integer
    add_column :cheese_libraries, :wine_image_updated_at, :datetime

  end

  def self.down

    remove_column :cheese_libraries, :cheese_image_file_name
    remove_column :cheese_libraries, :cheese_image_content_type
    remove_column :cheese_libraries, :cheese_image_file_size
    remove_column :cheese_libraries, :cheese_image_updated_at

    remove_column :cheese_libraries, :wine_image_file_name
    remove_column :cheese_libraries, :wine_image_content_type
    remove_column :cheese_libraries, :wine_image_file_size
    remove_column :cheese_libraries, :wine_image_updated_at

  end
end
