# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  # If there is no user session, or if the user is disabled, redirect to the login page
  def check_authentication
    return true unless current_user
  end
  
  #get the current user
  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
  
  #set the current user
  def current_user=(user)
    @current_user = user
  end
  
  # to get the page
  def get_page(page = nil)
    page ? (page.to_i < 1 ? 1 : page.to_i) : 1
  end
  
  #resets the page in session for cheeses
  def reset_page_in_session (count, session_page_value, rec_per_page)
    cur_page = session_page_value || 1
    if count > 0
      if cur_page > (count / rec_per_page)
        cur_page = count / rec_per_page
        cur_page += 1 if count % rec_per_page > 0
      end
    end
    cur_page = 1 if cur_page == 0
    return cur_page
  end
  
  def default_url_options(options = {})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {:locale => I18n.locale}
  end
  
  before_filter :set_locale
  
  private
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale]
  end
  
end
