class StudentStandardAcademicYearController < ApplicationController
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