class ProjectsController < ApplicationController
before_action :set_project, only: :show

  def show
    authorize @project
  end

  private
  
  def set_project
    @project = Project.find(params[:id])
  end
end
