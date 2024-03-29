class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #the flash hash is 2 key value pairs, 1 is success and 1 is fail
      #this is used to welcome the user after sign in once but not
      # everytime they view their profile
      flash[:success] = "Welcome to Mo's Twitter App!"
      #handle a successful save
      redirect_to @user
    else
      render 'new'
    end
  end

end
