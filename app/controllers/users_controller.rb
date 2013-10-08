class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

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
    if @user.authenticate(params[:user][:old_password]) 
      if @user.update(user_params)
        redirect_to users_url, notice: "User #{@user.name} was seccessfully updated."
      else
        render 'edit'
      end
    else
      redirect_to edit_user_path(@user)
      flash[:notice] = "Invalid password."
    end
  end

  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
