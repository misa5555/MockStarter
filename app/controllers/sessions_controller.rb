class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      sign_in(user)
      redirect_to root_url 
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def guest_login
    guest = User.find(1)
    sign_in(guest)
    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
