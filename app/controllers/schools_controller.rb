class SchoolsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def index
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
    end
    @schools = School.all
  end

  def show
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
    end
    @school = School.friendly.find(params[:id])
  end
  
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = "New school was successfully created"
      redirect_to school_path(@school)
    else
      render 'new'
    end
  end

  private

  def authenticate_admin!
    unless current_user.has_role?(:admin)
      flash[:danger] = "This action can only be done by ADMIN"
      redirect_to root_path
    end
  end

  def school_params
    params.require(:school).permit(:name, :head, :deputy_head, :academic_head, :assistant_a_h, :islamic_deputy, :environment_incharge)
  end
end