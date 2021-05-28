class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
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

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Student account updated successfully"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  private

  def set_student
    @student = Student.friendly.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:username, :email, :contact, :address, :father, :mother, :password, :password_confirmation, :full_name, :avatar)
  end
end
