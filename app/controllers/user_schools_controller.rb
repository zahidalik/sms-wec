class UserSchoolsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @schools = School.all
    @user = User.friendly.find(params[:user_id])
    @school = School.friendly.find(params[:school_id])
    @user_school = UserSchool.new
  end

  def create
    @user = User.friendly.find(params[:user_id])
    @school = School.friendly.find(params[:school_id])
    @user_school = UserSchool.new(user_id: @user.id, school_id: @school.id)
    
    if !UserSchool.where("user_id = :user_id AND school_id = :school_id", user_id: @user.id, school_id: @school.id).first
      if @user_school.save
        flash[:success] = "User's account has been created in the school"
        redirect_to user_schools_url(@user)
      else
        flash[:danger] = "We encountered a problem!"
        redirect_to user_url(@user)
      end
    else
      flash[:danger] = "The record is already present"
      redirect_to user_url(@user)
    end
  end

  private

  def authenticate_admin!
    unless current_user.has_role?(:admin)
      flash[:danger] = "You are not authorised to do this action"
      redirect_to user_url(current_user)
    end
  end
end