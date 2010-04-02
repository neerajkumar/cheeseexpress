# -*- coding: utf-8 -*-
class LoadData < ActiveRecord::Migration
  def self.up

    down

   # Load data into users table
    User.create(:username => "admin", :password => "@delicious").save!

    # Load data into milk_types table
    MilkType.create(:milk_type => "Cow Milk", :milk_type_in_french => "Lait de Vache").save!
    MilkType.create(:milk_type => "Goat Milk", :milk_type_in_french => "Lait de Chévre").save!
    MilkType.create(:milk_type => "Ewe Milk", :milk_type_in_french => "Lait de brebis").save!

    # Load data into cheese_types table
    CheeseType.create(:cheese_type => "Cooked, pressed hard cheese", :cheese_type_in_french => "Pâte pressée cuite").save!
    CheeseType.create(:cheese_type => "Soft pate", :cheese_type_in_french => "Pâte molle").save!
    CheeseType.create(:cheese_type => "Uncooked, pressed semi-hard cheese", :cheese_type_in_french => "Pâte pressée non cuite").save!
    CheeseType.create(:cheese_type => "Uncooked, unpressed soft cheese with a washed rind", :cheese_type_in_french => "Pâtes molle à croûte lavée").save!
    CheeseType.create(:cheese_type => "Uncooked, unpressed soft cheese with a white mould", :cheese_type_in_french => "Pâte molle à croûte fleurie").save!
    CheeseType.create(:cheese_type => "Uncooked, unpressed soft cheese with veins of blue mould", :cheese_type_in_french => "Pâte persillée").save!

    # Load data into regions table
    Region.create(:region => "Alsace").save!
    Region.create(:region => "Aquitaine").save!
    Region.create(:region => "Auvergne").save!
    Region.create(:region => "Basse Normandie").save!
    Region.create(:region => "Bourgogne").save!
    Region.create(:region => "Bretagne").save!
    Region.create(:region => "Centre").save!
    Region.create(:region => "Champagne-Ard.").save!
    Region.create(:region => "Corse").save!
    Region.create(:region => "Franche-Comte").save!
    Region.create(:region => "Haute-Normandie").save!
    Region.create(:region => "Ile-de-France").save!
    Region.create(:region => "Italy").save!
    Region.create(:region => "Languedoc-Rous.").save!
    Region.create(:region => "Limousin").save!
    Region.create(:region => "Loire (Pays de la)").save!
    Region.create(:region => "Lorraine").save!
    Region.create(:region => "Midi-Pyrenees").save!
    Region.create(:region => "Netherlands").save!
    Region.create(:region => "Nord-Pas-de-Calais").save!
    Region.create(:region => "Picardie").save!
    Region.create(:region => "Poitou-Charentes").save!
    Region.create(:region => "Provence").save!
    Region.create(:region => "Rhone-Alpes").save!
    Region.create(:region => "Suisse").save!
    
    # Load data into events table
    Event.create(
      :first_left_content => "The 1st event of this club took place in October 2008\, The 2nd session, on 17 January 2009 And the 3rd session on 4 April. We organise the event every two months", 
      :first_left_content_in_french => "L&lsquo;evenement 1er de ce club a eu lieu en Octobre 2008, la 2e session, le 17 Janvier 2009 et le 3eme session, le 4 avril. Nous organisons l'evenement tous les deux mois",
      :second_left_content => "We have organized une Soiree Tartiflette \(Tartiflette Night\) at the Seven Hotel",
      :second_left_content_in_french => "Nous avons organise Tartiflette Une Soiree \ (Tartiflette Night \) a l'Hotel Sept",
      :first_right_content => "Tartiflette is a French dish from Savoie region in Alps\. It is originated in the valley of Aravis, the home of Reblochon cheese. Tartiflette is made with potatoes\, reblochon cheese\, and some kind of meat like bacon\. It is extremely popular in mountain restaurants during ski season",
      :first_right_content_in_french => "Tartiflette est un plat francais de la region de Savoie dans les Alpes \. Il est originaire de la vallee des Aravis, la maison du Reblochon. Tartiflette est faite avec des pommes de terre \, reblochon \, et une certaine forme de viande, comme le bacon \. Il est extremement populaire dans les restaurants de montagne pendant la saison de ski",
      :second_right_content => "The next Cheese Club session is planned in November 2009\.",
      :second_right_content_in_french => "La prochaine session du Club de fromage est prevue en Novembre 2009 \."
      ).save!

  end

  def self.down
    User.delete_all
    MilkType.delete_all
    CheeseType.delete_all
    Region.delete_all
    Event.delete_all
  end
end
