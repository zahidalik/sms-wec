class MttcUsersController < ApplicationController
  before_action :authenticate_mttc_admin!, only: [:new, :create, :edit, :update]
  before_action :set_mttc_user, only: [:show, :edit, :update]

  def index
    @mttc_users = MttcUser.all
  end

  def show
  end

  def new
    @mttc_user = MttcUser.new
  end

  def create
    @mttc_user = MttcUser.new(mttc_user_params)
    if @mttc_user.save && @mttc_user_designation.save
      flash[:success] = "New MTTC User has been successfully created!"
      redirect_to mttc_user_path(@mttc_user)
    else
      render 'new'
    end
  end

  def edit   
  end

  def update
    if @mttc_user.update
      flash[:success] = "Account was updated successfully!"
      redirect_to mttc_user_path(@mttc_user)
    else
      render 'new'
    end
  end

  private

  def set_mttc_user
    @mttc_user = MttcUser.friendly.find(params[:id])
  end

  def mttc_user_params
    params.require(:mttc_user).permit(:username, :full_name, :email, :mobile, :address, :password, :password_confirmation, designation_ids: [])
  end

  def authenticate_mttc_admin!
    unless current_user.is_admin?
      flash[:danger] = "You are not authorised!"
      redirect_to mttc_user_path(@mttc_user)
    end
  end
end
