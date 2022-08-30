class ProjectsController < ApplicationController

  def show
    authorize @project
  end 
end
