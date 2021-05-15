class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @students = Student.all
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :mobile, :address, :password, :password_confirmation, :full_name)
  end
end
