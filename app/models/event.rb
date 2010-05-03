class Event < ActiveRecord::Base
  acts_as_textiled :first_left_content, :second_left_content, :first_right_content, :second_right_content, :first_left_content_in_french, :second_left_content_in_french, :first_right_content_in_french, :second_right_content_in_french
  
  ################
  # Validations
  ################
  
  validates_presence_of :first_left_content, :second_left_content, :first_right_content, :second_right_content, :first_left_content_in_french, :second_left_content_in_french, :first_right_content_in_french, :second_right_content_in_french
  
  # PaperClip
  has_attached_file :first_image, :styles => {:thumb => '272x200'},
  :url  => "/system/first_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/first_images/:id/:style/:basename.:extension"
  has_attached_file :second_image, :styles => {:thumb => '272x200'},
  :url  => "/system/second_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/second_images/:id/:style/:basename.:extension"
  has_attached_file :third_image, :styles => {:thumb => '272x200'},
  :url  => "/system/third_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/third_images/:id/:style/:basename.:extension"
  has_attached_file :fourth_image, :styles => {:thumb => '272x200'},
  :url  => "/system/fourth_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/fourth_images/:id/:style/:basename.:extension"
  has_attached_file :fifth_image, :styles => {:thumb => '272x200'},
  :url  => "/system/fifth_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/fifth_images/:id/:style/:basename.:extension"
  has_attached_file :sixth_image, :styles => {:thumb => '272x200'},
  :url  => "/system/sixth_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/sixth_images/:id/:style/:basename.:extension"
  has_attached_file :seventh_image, :styles => {:thumb => '272x200'},
  :url  => "/system/seventh_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/seventh_images/:id/:style/:basename.:extension"

  def update_obj(params)
    begin
      transaction do

	self.first_left_content = params[:event][:first_left_content]
	self.first_left_content_in_french = params[:event][:first_left_content_in_french]
	self.second_left_content = params[:event][:second_left_content]
	self.second_left_content_in_french = params[:event][:second_left_content_in_french]
	self.first_right_content = params[:event][:first_right_content]
	self.first_right_content_in_french = params[:event][:first_right_content_in_french]

        raise "Could not update self" unless self.update_attributes(params[:event])
      end
    rescue
      return false
    end
    return true
  end
end