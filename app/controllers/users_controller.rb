class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def create
    user_params = params["user"].permit("login", "password", "password_confirmation")
    @user = User.new(user_params)
    if @user.save 
      redirect_to(root_path)
    else
      render "new"
    end
  end
  def update
  end
  def show
    @user = User.find(params["id"])
  end
end
