class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      login(@user)
      redirect_to search_path
    else
      flash.now[:notice] = "Please use a valid email/password"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
