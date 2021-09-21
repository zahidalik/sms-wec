class StudentStandardAcademicYearsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @student = Student.friendly.find(params[:student_id])
    @standard = Standard.friendly.find(params[:standard_id])
    @student_standard = StudentStandardAcademicYear.new
  end

  def create
    @student = Student.friendly.find(params[:student_id])
    @standard = Standard.friendly.find(params[:standard_id])
    @student_standard = StudentStandardAcademicYear.new(academic_year_params)
    @student_standard.student_id = @student.id
    @student_standard.standard_id = @standard.id

    if @student_standard.save
      if @student_standard.user_subjects.any?
        @student_standard.user_subjects.each do |user_subject|
          user_standard = user_subject.user_standard_academic_year 
          @student_standard.student_subjects.create(name: user_subject.name, student_standard_academic_year_id: @student_standard.id, user_standard_academic_year_id: user_standard.id)
        end
      end
      flash[:success] = "Student has been successfully added to the class"
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  private

  def academic_year_params
    params.require(:student_standard_academic_year).permit(:year)
  end
end