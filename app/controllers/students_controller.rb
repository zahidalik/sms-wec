class StudentsController < ApplicationController
  def show
    @student = Student.friendly.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if !User.find_by(username: student_params[:username])
      if @student.save
        flash[:success] = "Student account has been created successfully!"
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

  def student_params
    params.require(:student).permit(:username, :email, :contact, :address, :father, :mother, :password, :password_confirmation, :full_name)
  end
end
