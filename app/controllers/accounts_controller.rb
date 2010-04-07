class AccountsController < ApplicationController
  
  # GET /accounts/sign_in
  def sign_in
    
  end
  
  # GET /login
  def login
    @continue = params[:continue]
    if request.post?
      @user = User.new
      @user.username = params[:user][:username]
      begin
        self.current_user = User.authenticate(params[:user][:username], params[:user][:password])
        set_session
        flash[:notice] = t 'flash.login'
      rescue User::InvalidLoginIdOrPassword
        flash[:notice] = t 'flash.invalid-login'
      end
      
      redirect_to(@continue || :action => "index", :controller => "homes")
    end
  end

  # GET /logout
  def logout
    self.current_user = nil if current_user
    locale_params = session[:locale]
    reset_session
    session[:locale] = locale_params
    redirect_to(:action => "sign_in", :controller => "accounts")
  end

  
  ## ----------------
  ## Private Actions
  ## ----------------

  private
  #sets the session
  def set_session
    session[:user_id] = self.current_user.id
  end
end

