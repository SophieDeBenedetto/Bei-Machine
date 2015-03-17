class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit]


  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_path, :notice => "Thank you for signing up!"
    else
      render :new
    end
  end

  def my_results
    binding.pry
    @results = Bee.where(user_id: current_user.id)  
  end
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end