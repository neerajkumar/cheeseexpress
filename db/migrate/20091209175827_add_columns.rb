class AddColumns < ActiveRecord::Migration
  def self.up
    add_column :cheese_libraries, :description_in_french, :string, :limit => 700
    add_column :cheese_libraries, :wine_description_in_french, :string, :limit => 700
    add_column :cheese_libraries, :milk_in_french, :string
    add_column :milk_types, :milk_type_in_french, :string
    add_column :cheese_types, :cheese_type_in_french, :string
  end

  def self.down
    remove_column :cheese_libraries, :description_in_french
    remove_column :cheese_libraries, :wine_description_in_french
    remove_column :cheese_libraries, :milk_in_french
    remove_column :milk_types, :milk_type_in_french
    remove_column :cheese_type, :cheese_type_in_french
  end
end
