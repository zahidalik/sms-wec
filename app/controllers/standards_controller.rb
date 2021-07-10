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
      @student_standard = StudentStandardAcademicYear.where(student_id: @student.id, standard_id: @standard.id, year: Date.current.year).first
      @subjects = @student_standard.student_subjects
    end
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
      @user_standard = UserStandardAcademicYear.where(user_id: @user.id, standard_id: @standard.id, year: Date.current.year).first
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