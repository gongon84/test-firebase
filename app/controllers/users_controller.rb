class UsersController < ApplicationController
  
  def index
  end
  
  def new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.permit(:email, :password)
  end
end
