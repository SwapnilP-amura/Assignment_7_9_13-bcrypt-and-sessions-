class SessionsController < ApplicationController

  def new
    #login page
    if logged_in?
      #if already logged in dont render log in page ,redirect to show page
      redirect_to user_path(current_user)
    end
  end

  def create
    flash[:success]="You have Logged in Successfully"

    user=User.find_by(:username=>params[:session_hash][:username])

    #check user exist and password is correct
    if user && user.authenticate(params[:session_hash][:password])
      log_in user                     #sets session
      redirect_to user_path(user)     #redirect to show
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
      #if failed render with flash
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

end
