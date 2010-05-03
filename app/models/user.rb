class User < ActiveRecord::Base
  
  ##authenticates the user
  #if no error, return the user object
  #otherwise raise the error
  class << self

   def authenticate(username, password)

    ##check for blank username or password
    raise InvalidLoginIdOrPassword if username.blank? or password.blank?

    ##find the user
    user = User.find_by_username(username)
      
    #if not found raise the error
    raise InvalidLoginIdOrPassword if user.nil?
      
    #raise error if password does not match
    raise InvalidLoginIdOrPassword if user.password != password

    #return the user
    user
  end
 
  end
  
  ## -----------------
  ## Exception Classes
  ## -----------------
  class InvalidLoginIdOrPassword < Exception; end;
  
end
