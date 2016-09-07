class SessionsController < ApplicationController

  def new
    #login page
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    flash[:success]="You have Logged in Successfully"

    user=User.find_by(:username=>params[:session_hash][:username])

    if user && user.authenticate(params[:session_hash][:password])
      #session[:id]=user.id
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

end
