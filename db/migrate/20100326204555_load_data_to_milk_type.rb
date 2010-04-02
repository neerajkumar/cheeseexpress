# -*- coding: utf-8 -*-
class LoadDataToMilkType < ActiveRecord::Migration
  def self.up
    milk_type1 = MilkType.find_by_milk_type("Goat Milk")
    milk_type1.milk_type_in_french = "Lait de Chèvre"
    milk_type1.save!
  end

  def self.down
  end
end
