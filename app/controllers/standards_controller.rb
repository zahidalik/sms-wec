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
end