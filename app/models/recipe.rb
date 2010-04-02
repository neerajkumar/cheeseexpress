class Recipe < ActiveRecord::Base
  
  ###############
  # Validations
  ###############

  validates_presence_of :recipecheese_image, :method, :cheese_title, :wine_description, :method_in_french, :wine_description_in_french
  validates_numericality_of :preperation_time, :cooking_time, :only_integer => false, :allow_nil => true, :greater_than => 0, :message => "must be a valid float or integer number greater than 0"
  validates_numericality_of :number_of_persons_for, :only_integer => true, :allow_nil => true, :greater_than => 0, :message => "must be a valid integer number greater than 0"
  validates_uniqueness_of :cheese_title
  
  validates_attachment_presence :recipecheese_image
  validates_attachment_size :recipecheese_image, :less_than => 5.megabytes
  validates_attachment_content_type :recipecheese_image, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/x-png', 'image/gif']
  validates_attachment_presence :recipewine_image
  validates_attachment_size :recipewine_image, :less_than => 5.megabytes
  validates_attachment_content_type :recipewine_image, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/x-png', 'image/gif']

  def validate
    
  end

  ##############
  # Callbacks
  ##############
  before_validation :trim_recipe
  
  # PaperClip
  has_attached_file :recipecheese_image, :styles => {:thumb => '203x165>'},
  :url  => "/system/recipecheese_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/recipecheese_images/:id/:style/:basename.:extension"
  has_attached_file :recipewine_image, :styles => {:small => '80x100>'},
  :url  => "/system/recipewine_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/recipewine_images/:id/:style/:basename.:extension"
  
  ##################
  ## Action Methods
  ##################
  
  def save_obj(params)
    begin
      transaction do
        self.ingredient = ""
        params[:ingredient][:ingredient].each do |ingredient|
          self.ingredient += ingredient.squish + "\," unless ingredient.blank?
        end
	self.ingredient_in_french = ""
        params[:ingredient][:ingredient_in_french].each do |ingredient|
          self.ingredient_in_french += ingredient.squish + "\," unless ingredient.blank?
        end

    raise "Could not save self" unless self.save
      end    
    rescue
      return false
    end
    return true
  end
  
  def update_obj(params)
    begin
      transaction do
        self.ingredient = ""
        params[:ingredient][:ingredient].each do |ingredient|
          self.ingredient += ingredient.squish + "\," unless ingredient.blank?
        end
        
        self.ingredient_in_french = ""
        params[:ingredient][:ingredient_in_french].each do |ingredient|
          self.ingredient_in_french += ingredient.squish + "\," unless ingredient.blank?
        end


        raise "Could not update self" unless self.update_attributes(params[:recipe])
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
  def trim_recipe
    self.cheese_title = cheese_title.squish if cheese_title
    #self.number_of_persons_for = number_of_persons_for.squish if number_of_persons_for
    #self.preperation_time = preperation_time.squish if preperation_time
    #self.cooking_time = cooking_time.squish if cooking_time
    self.method = method.squish if method
    self.remark = remark.squish if remark
  end
  
end