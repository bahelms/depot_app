class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.order(:name)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: "User #{@user.name} was successfully created."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: "User #{@user.name} was seccessfully updated."
    else
      render 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
