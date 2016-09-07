module SessionsHelper

  def log_in(user)
      session[:user_id] = user.id
      #this session is session method of rails
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
      #because everytime call to current user shouldnt hit databse
  end


  def logged_in?
      #this calls current user
      !current_user.nil?
  end

  def log_out
      session.delete(:user_id)
      #set current user to nil important
      #so that next time it will evaluate code in lazy evaluation , in current_user
      @current_user = nil
  end

end
