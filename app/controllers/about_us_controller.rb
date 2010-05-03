class AboutUsController < ApplicationController

  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication

  # GET /about_us
  # GET /about_us.xml
  def index
    
  end
end
