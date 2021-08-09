class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to("/users/#{@user.id}/show")
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_url)
  end
end
