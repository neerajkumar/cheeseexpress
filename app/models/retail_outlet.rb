class RetailOutlet < ActiveRecord::Base
  
  ###############
  # Validations
  ###############

  validates_presence_of :name, :email, :address, :mobile
  validates_length_of :mobile, :in => 10..12, :on => :create, :message => 'Sample: 09812345678'
  validates_numericality_of :mobile, :only_integer => true, :allow_nil => false, :greater_than => 0, :message => "must be a valid number" 
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :message => "Invalid Format", :unless => Proc.new{|retail_outlet| retail_outlet.email.blank?}
end
