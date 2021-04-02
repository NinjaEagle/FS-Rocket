class SessionsController < ApplicationController
  # create user
  def create
    @user = User.find_user(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      render :show
    else
      render json: ['Invalid Username & Password. Try again'], status: 401
    end
  end

  def user_logged_in?
    if logged_in? && current_user
      render :show
    else
      render json: { id: nil, username: "" }
    end
  end

  def destroy
    if current_user
      logout!
      render json: {}
    else
      render json: ["Signed out"], status: 404
    end
  end

end
