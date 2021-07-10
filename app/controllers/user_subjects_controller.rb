class UserSubjectsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @user = User.friendly.find(params[:user_id])
    @user_standard_academic_year = UserStandardAcademicYear.friendly.find(params[:user_standard_academic_year_id])
    @standard = @user_standard_academic_year.standard
    @user_subject = UserSubject.new
  end

  def create
    @user = User.friendly.find(params[:user_id])
    @user_standard_academic_year = UserStandardAcademicYear.friendly.find(params[:user_standard_academic_year_id])
    @standard = @user_standard_academic_year.standard
    @user_subject = UserSubject.new(subject_params)
    @user_subject.user_standard_academic_year = @user_standard_academic_year

    if @user_subject.save
      @user_standard_academic_year.students.each do |student|
        student.student_standard_academic_years.where(year: @user_standard_academic_year.year, standard_id: @standard.id).each do |student_standard|
          student_standard.student_subjects.create(
            name: @user_subject.name,
            user_standard_academic_year_id: @user_standard_academic_year.id,
            student_standard_academic_year_id: student_standard.id
          )
        end
      end        
      flash[:success] = "Subject has been successfully added for the teacher!"
      redirect_to user_standard_url(@user, @standard)
    else
      render 'new'
    end
  end

  private

  def subject_params
    params.require(:user_subject).permit(:name)
  end
end