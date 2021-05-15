class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?, :user_signed_in_student?,
                :user_signed_in_non_student?

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

  def user_signed_in_non_student?
    !!session[:user_id]
  end

  def user_signed_in_student?
    !!session[:student_id]
  end
end
