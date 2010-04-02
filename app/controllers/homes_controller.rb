class HomesController < ApplicationController
  
  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication
  
  # GET /homes
  # GET /homes.xml
  def index
  end

end
