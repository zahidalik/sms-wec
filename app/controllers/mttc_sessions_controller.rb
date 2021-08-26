class MttcSessionsController < ApplicationController
  before_action :mttc_user_logged_in?, only: [:new]
  def new
    # code
  end

  def create
    user = MttcUser.find_by(username: params[:mttc_sessions][:username])
    # student = Student.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:mttc_sessions][:password])
      session[:mttc_user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to mttc_user_path(current_user)
    # elsif student && student.authenticate(params[:sessions][:password])
    #   session[:student_id] = student.id
    #   flash[:success] = "You have successfully logged in"
    #   redirect_to student_path(current_user)
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:mttc_user_id] = nil
    # session[:student_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

  private

  def mttc_user_logged_in?
    if current_user
      flash[:warning] = "User already logged in"
      redirect_to user_path(current_user)
    end
  end
end
