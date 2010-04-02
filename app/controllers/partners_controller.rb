class PartnersController < ApplicationController
  
  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication
  
  # GET /partners
  # GET /partners.xml
  def index
  end

end
