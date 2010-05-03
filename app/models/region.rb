class Region < ActiveRecord::Base
  
  ###############
  # Association
  ###############
  has_many :cheese_libraries, :class_name => "CheeseLibrary"
end
