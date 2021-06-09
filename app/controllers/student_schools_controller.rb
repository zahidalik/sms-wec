class StudentSchoolsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @schools = School.all
    @student = Student.friendly.find(params[:student_id])
    @school = School.friendly.find(params[:school_id])
    @user_school = StudentSchool.new
  end

  def create
    @student = Student.friendly.find(params[:student_id])
    @school = School.friendly.find(params[:school_id])
    @student_school = StudentSchool.new(student_id: @student.id, school_id: @school.id)
    
    if !StudentSchool.where("student_id = :student_id AND school_id = :school_id", student_id: @student.id, school_id: @school.id).first
      if @student_school.save
        flash[:success] = "Student's account has been created in the school"
        redirect_to student_schools_url(@student)
      else
        flash[:danger] = "We encountered a problem!"
        redirect_to student_url(@student)
      end
    else
      flash[:danger] = "The record is already present"
      redirect_to student_url(@student)
    end
  end
end