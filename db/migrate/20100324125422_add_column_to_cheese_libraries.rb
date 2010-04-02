class AddColumnToCheeseLibraries < ActiveRecord::Migration
  def self.up
    add_column :cheese_libraries, :maturing_period_in_english, :string
    add_column :cheese_libraries, :maturing_period_in_french, :string
  end

  def self.down
    remove_column :cheese_libraries, :maturing_period_in_english 
    remove_column :cheese_libraries, :maturing_period_in_french
  end
end
