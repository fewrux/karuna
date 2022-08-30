class ProjectsController < ApplicationController

  def index
    @projects = policy_scope(Project)
  end

  def show
    authorize @project
  end
end
