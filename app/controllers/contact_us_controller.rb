class ContactUsController < ApplicationController
  
  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication
  
  # GET /contact_us
  # GET /contact_us.xml
  def index
  end

end
