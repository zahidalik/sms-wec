class SessionsController < ApplicationController
  def new
    # code
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    student = Student.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    elsif student && student.authenticate(params[:sessions][:password])
      session[:student_id] = student.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:student_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
end
