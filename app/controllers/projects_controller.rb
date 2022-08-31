class ProjectsController < ApplicationController
before_action :set_project, only: :show


  def show
    authorize @project
    @booking = Booking.new
    authorize @booking
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def index
    @projects = policy_scope(Project)
  end

end
