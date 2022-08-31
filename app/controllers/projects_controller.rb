class ProjectsController < ApplicationController

  def index
    @projects = policy_scope(Project)

    # fazer o search para projects usando params[:query]
  end

  # def show
  #   authorize @project
  # end
end
