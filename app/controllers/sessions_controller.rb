class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(login: params["user"][:login])
    if user && user.authenticate(params["user"][:password])
      session[:user_id] = user.id
      redirect_to(root_path)
    else
      render "new"
    end
  end
  def show
    @user = User.find(params["id"])
  end
  def destroy
    session[:user_id]=nil
    redirect_to(root_path)
  end
     
end
