class MttcUsersController < ApplicationController
  def show
    @mttc_user = MttcUser.friendly.find(params[:id])
  end
end
