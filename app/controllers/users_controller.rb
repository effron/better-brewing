class UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page]).per(12)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end