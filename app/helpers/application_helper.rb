# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    include WillPaginate::ViewHelpers 
    
    def will_paginate_with_i18n(collection, options = {}) 
        will_paginate_without_i18n(collection, options.merge(:previous_label => I18n.t(:previous), :next_label => I18n.t(:next))) 
    end 
    
    alias_method_chain :will_paginate, :i18n  

  def milk_type_list(locale)
    @milk_types = MilkType.find(:all)
    str = []
    case locale
    when 'en'
      @milk_types.each do |m|
        str << m.milk_type
      end
    when 'fr'
      @milk_types.each do |m|
        
        str << m.milk_type_in_french
      end
    end
    str
  end

  def cheese_type_list(locale)
    @cheese_types = CheeseType.find(:all)
    str = []

    case locale
    when 'en'
      @cheese_types.each do |c|
        str << c.cheese_type
      end
    when 'fr'
      @cheese_types.each do |c|
        str << c.cheese_type_in_french
      end
    end
    str
  end

  def region_list()
    str = []
    @regions = Region.find(:all)
    @regions.each do |r|
      str << r.region
    end
    str
  end

  def aoc(cheese)
    cheese.aoc == ('Yes' || 'Oui') ? (t 'aoc-yes') : (t 'aoc-no')
  end

  def aoc_array(locale)
    str = []
    case locale
      when 'en'
        str << ['Yes']
        str << ['No']
      when 'fr'
        str << ['Oui']
        str << ['Non']
    end
    str
  end
end
