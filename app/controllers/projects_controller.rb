class ProjectsController < ApplicationController

  def index
    @projects = policy_scope(Project)

    # fazer o search para projects usando params[:query]
  end

  # def show
  #   authorize @project
  # end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.organization = current_organization

    authorize @project

    if @project.save!
      redirect_to root_path, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name,
                                    :description,
                                    :category,
                                    :address,
                                    :city,
                                    :available_spots,
                                    :start_date,
                                    :end_date)
  end
end
