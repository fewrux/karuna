class ProjectsController < ApplicationController
before_action :set_project, only: :show


  def show
    authorize @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def index
    @projects = policy_scope(Project)

    # fazer o search para projects usando params[:query]
  end

  # def show
  #   authorize @project
  # end
end
