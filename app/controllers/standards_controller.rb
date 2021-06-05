class StandardsController < ApplicationController
  def index
    if params[:school_id]
      @school = School.friendly.find(params[:school_id])
      @school_standards = @school.standards
    end
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
      @user_standards = @user.standards
    end
    @standards = Standard.all
  end
  
  def show
    # @school = School.friendly.find(params[:id])
    @standard = Standard.friendly.find(params[:id])
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