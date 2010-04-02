class CheeseLibrary < ActiveRecord::Base
  
  #############
  # Association
  #############
  belongs_to :milk_type, :class_name => "MilkType"
  belongs_to :cheese_type, :class_name => "CheeseType"
  belongs_to :region, :class_name => "Region"

  ###############
  # Validations
  ###############

  validates_presence_of :cheese_title, :description, :description_in_french, :cheese_milk, :milk_in_french, :average_weight, :milk_type_id, :cheese_type_id, :region_id, :fat_content, :cheese_image, :wine_description, :wine_description_in_french
  #validates_numericality_of :average_weight, :fat_content, :only_integer => false, :allow_nil => true, :greater_than => 0, :message => "must be a valid float number greater than 0"
  validates_uniqueness_of :cheese_title
  validates_attachment_presence :cheese_image
  validates_attachment_size :cheese_image, :less_than => 5.megabytes
  validates_attachment_content_type :cheese_image, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/x-png', 'image/gif']
  validates_attachment_presence :wine_image
  validates_attachment_size :wine_image, :less_than => 5.megabytes
  validates_attachment_content_type :wine_image, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/x-png', 'image/gif']
  
  def validate
    errors.add(:fat_content, (t 'message.fat-content')) if (!fat_content.blank? && fat_content > 100)
  end
  
  # PaperClip
  has_attached_file :cheese_image, :styles => {:thumb => '203x165>'},
  :url  => "/system/cheese_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/cheese_images/:id/:style/:basename.:extension"
  has_attached_file :wine_image, :styles => {:small => '150x100>'},
  :url  => "/system/wine_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/wine_images/:id/:style/:basename.:extension"

  ##############
  # Callbacks
  ##############
  before_validation :trim_cheese, :get_boolean_aoc

  ###################
  ## Actions Methods
  ###################

  def save_obj(params)
    begin
      transaction do
        self.milk_type = MilkType.find_by_milk_type(params[:cheese][:milk]) || MilkType.find_by_milk_type_in_french(params[:cheese][:milk])
        self.cheese_type = CheeseType.find_by_cheese_type(params[:cheese][:type]) || CheeseType.find_by_cheese_type_in_french(params[:cheese][:type])
        self.region = Region.find_by_region(params[:cheese][:region])

        self.save
      end
    rescue
      return false
    end
    return true
  end

  def update_obj(params)
    begin
      transaction do
        self.milk_type = MilkType.find_by_milk_type(params[:cheese][:milk]) || MilkType.find_by_milk_type_in_french(params[:cheese][:milk])
        self.cheese_type = CheeseType.find_by_cheese_type(params[:cheese][:type]) || CheeseType.find_by_cheese_type_in_french(params[:cheese][:type])
        self.region = Region.find_by_region(params[:cheese][:region])
        raise "Could not update self" unless self.update_attributes(params[:cheese_library])
      end
    rescue
      return false
    end
    return true
  end
  
  ###################
  # Private Actions
  ##################
  private
  
  #trims the white spaces
  def trim_cheese
    self.cheese_title = cheese_title.squish if cheese_title
    self.cheese_milk = cheese_milk.squish if cheese_milk
    self.description = description.squish if description
  end
  
  def get_boolean_aoc
    if aoc == "yes"
      self.aoc = 1
    elsif aoc == "no"
      self.aoc = 0
    end
  end
  
end
