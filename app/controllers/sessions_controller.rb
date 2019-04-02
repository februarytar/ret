class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email (param[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to root_url, notice: "Yeay, logged in!"
    else
      flash.now[:alert] = "Ops! Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You already logged out!"
  end

end
