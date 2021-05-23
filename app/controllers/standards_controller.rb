class StandardsController < ApplicationController
  def index
    @school = School.friendly.find(params[:school_id])
    @school_standards = @school.standards
  end
  
  def show
    @school = School.friendly.find(params[:id])
    # @school_standard = @school.standards.find(params[:id])
  end
end