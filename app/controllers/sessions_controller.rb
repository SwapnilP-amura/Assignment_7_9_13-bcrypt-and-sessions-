class SessionsController < ApplicationController

  def new
    #login page

  end

  def create
    #log user in
    #render plain: params
    @user=User.find_by(:username=>params[:session_hash][:username])

    if @use && @user.authenticate(params[:session_hash][:password])
      session[:id]=@user.username
      else

    end



    render plain: @user
  end

  def destroy
    #delete session
  end

end
