class UsersController < ApplicationController
  
  def index
  end
  
  def new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "登録しました"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
