class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if !Student.find_by(username: user_params[:username])
      if @user.save
        flash[:success] = "User account has been created successfully!"
        redirect_to user_path(current_user)
      else
        render 'new'
      end
    else
      flash.now[:danger] = "Please change your username"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User account updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :mobile, :address, :password, :password_confirmation, :full_name, role_ids: [])
  end
end
