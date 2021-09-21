class StandardsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def index
    if params[:school_id]
      @school = School.friendly.find(params[:school_id])
      @school_standards = @school.standards
    end
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
      @user_standards = @user.standards
    end
    if params[:student_id]
      @student = Student.friendly.find(params[:student_id])
      @student_standards = @student.standards
    end
    @standards = Standard.all
  end
  
  def show
    # @school = School.friendly.find(params[:id])
    @standard = Standard.friendly.find(params[:id])
    @standard_subjects = @standard.user_subjects
    if params[:student_id]
      @student = Student.friendly.find(params[:student_id])
      academic_year_one = Date.current.year
      academic_year_two = Date.current.year.to_s + "-" + (Date.current.year + 1).to_s
      if StudentStandardAcademicYear.where(student_id: @student.id, standard_id: @standard.id, year: academic_year_one).first
        @student_standard = StudentStandardAcademicYear.where(student_id: @student.id, standard_id: @standard.id, year: academic_year_one).first
      else
        @student_standard = StudentStandardAcademicYear.where(student_id: @student.id, standard_id: @standard.id, year: academic_year_two).first
      end
      @subjects = @student_standard.student_subjects
    end
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
      academic_year_one = Date.current.year
      academic_year_two = Date.current.year.to_s + "-" + (Date.current.year + 1).to_s
      if UserStandardAcademicYear.where(user_id: @user.id, standard_id: @standard.id, year: academic_year_one).first
        @user_standard = UserStandardAcademicYear.where(user_id: @user.id, standard_id: @standard.id, year: academic_year_one).first
      else
        @user_standard = UserStandardAcademicYear.where(user_id: @user.id, standard_id: @standard.id, year: academic_year_two).first
      end
      @user_subjects = @user_standard.user_subjects
    end
  end

  def edit
    @standard = Standard.friendly.find(params[:id])
  end

  def update
    @standard = Standard.friendly.find(params[:id])
    if @standard.update(standard_params)
      flash[:success] = "Class has been updated successfully!"
      redirect_to standard_url(@standard)
    else
      render 'edit'
    end
  end

  def new
    @school = School.friendly.find(params[:school_id])
    @standard = Standard.new
  end

  def create
    @school = School.friendly.find(params[:school_id])
    @standard = Standard.new(standard_params)
    @standard.school_id = @school.id

    if @standard.save
      flash[:success] = "Account for standard/class was successfully created!"
      redirect_to standard_url(@standard)
    else
      render "new"
    end
  end

  private

  def standard_params
    params.require(:standard).permit(:name, :section, :class_teacher)
  end
end