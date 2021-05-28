class UserStandardAcademicYearController < ApplicationController
  def new
    @user = User.friendly.find(params[:user_id])
    @standard = Standard.friendly.find(params[:standard_id])
    @user_standard = UserStandardAcademicYear.new
  end
end