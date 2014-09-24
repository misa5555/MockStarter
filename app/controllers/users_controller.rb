class UsersController < ApplicationController
 before_filter :require_user_signin!, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_url 
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url(@user) 
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:password, :username, :avator)
  end
end
