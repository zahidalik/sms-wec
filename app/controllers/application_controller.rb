class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  def current_user
    if session[:user_id]
      session_user = User.find(session[:user_id])
    elsif session[:student_id]
      session_user = Student.find(session[:student_id])
    end
    @current_user ||= session_user
  end

  def user_signed_in?
    !!current_user
  end
end
