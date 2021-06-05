class UserStandardAcademicYearController < ApplicationController
  def new
    @user = User.friendly.find(params[:user_id])
    @standard = Standard.friendly.find(params[:standard_id])
    @user_standard = UserStandardAcademicYear.new
  end

  def create
    @user = User.friendly.find(params[:user_id])
    @standard = Standard.friendly.find(params[:standard_id])
    @user_standard = UserStandardAcademicYear.new(academic_year_params)
    @user_standard.user_id = @user.id
    @user_standard.standard_id = @standard.id

    if @user_standard.save
      flash[:success] = "User has been successfully added to the class"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def academic_year_params
    params.require(:user_standard_academic_year).permit(:year)
  end
end