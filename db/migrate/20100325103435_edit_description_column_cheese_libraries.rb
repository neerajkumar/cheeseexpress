class EditDescriptionColumnCheeseLibraries < ActiveRecord::Migration
  def self.up
    remove_column :cheese_libraries, :description
    add_column :cheese_libraries, :description, :string, :limit => 1200 
    remove_column :recipes, :method 
    add_column :recipes, :method, :string, :limit => 1200 
  end

  def self.down
    add_column :cheese_libraries, :description
    remove_column :cheese_libraries, :description
    add_column :recipes, :method 
    remove_column :recipes, :method
  end
end
