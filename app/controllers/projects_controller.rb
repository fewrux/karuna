class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit]

  def index
    @projects = policy_scope(Project)
    # @projects.search_by_category(params[:category])
    if params[:category].present?
      @projects = policy_scope(Project).search_by_category(params[:category])
    elsif params[:continent].present?
      @projects = policy_scope(Project).search_by_continent(params[:continent])
    elsif params[:query].present?
      @projects = policy_scope(Project).search_by_project(params[:query])
    end
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.organization = current_organization

    authorize @project

    if @project.save!
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @project
  end

  def update
  end

  def show
    authorize @project
    @booking = Booking.new
    authorize @booking
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name,
                                    :description,
                                    :category,
                                    :address,
                                    :city,
                                    :available_spots,
                                    :start_date,
                                    :end_date,
                                    photos: []
                                   )
  end
end
