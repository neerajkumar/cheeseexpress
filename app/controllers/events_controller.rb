class EventsController < ApplicationController
  
  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication
  
  # GET /events
  # GET /events.xml
  def index
    @event = Event.find(:first)
  end
  
  def edit_event
    if !@current_user.nil? && @current_user.username == "admin"
      @event = Event.find(:first)
    else
      flash[:notice] = "You are not Authorized to access this page."
    end
  end

  def update_event
    if !@current_user.nil? && @current_user.username == "admin"
      @event = Event.find(:first)
    
      respond_to do |format|
        if params[:commit] == "Cancel"
          format.html { redirect_to(events_url) }
          format.xml  { head :ok }
        elsif @event.update_obj(params)
          flash[:notice] = 'Event was successfully updated.'
          format.html { redirect_to(events_url) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit_event" }
          format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "You are not Authorized to access this page."
    end
  end
end
