class LoadDataToCheeseType < ActiveRecord::Migration
  def self.up
  cheese_type1 = CheeseType.find_by_cheese_type("Soft pate")
  cheese_type1.cheese_type_in_french = "Pâte molle"
  cheese_type1.save
  cheese_type2 = CheeseType.find_by_cheese_type("Uncooked, unpressed soft cheese with veins of blue mould")
  cheese_type2.cheese_type_in_french = "Pâte persillée"
  cheese_type2.save
  cheese_type3 = CheeseType.find_by_cheese_type("Uncooked, pressed semi-hard cheese")
  cheese_type3.cheese_type_in_french = "Pâte pressée non cuite"
  cheese_type3.save
  cheese_type4 = CheeseType.find_by_cheese_type("Uncooked, unpressed soft cheese with a white mould")
  cheese_type4.cheese_type_in_french = "Pâte molle à croûte fleurie"
  cheese_type4.save
  cheese_type5 = CheeseType.find_by_cheese_type("Uncooked, unpressed soft cheese with a washed rind")
  cheese_type5.cheese_type_in_french = "Pâte molle à croûte lavée"
  cheese_type5.save
  cheese_type6 = CheeseType.find_by_cheese_type("Cooked, pressed hard cheese")
  cheese_type6.cheese_type_in_french = "Pâte pressée cuite"
  cheese_type6.save
  end

  def self.down
  end
end
