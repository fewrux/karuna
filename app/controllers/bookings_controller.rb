class BookingsController < ApplicationController
  before_action :set_booking, only: %i[accept decline missed concluded]
  before_action :set_organization, only: %i[accept decline missed concluded]

  def create
    @project = Project.find(params[:project_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.project = @project

    authorize @booking

    if @booking.save
      redirect_to user_path(current_user), notice: "Booking created"
    elsif !user_signed_in?
      redirect_to new_user_registration_path
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  def accept
    authorize @booking
    if @booking.accepted!
      redirect_to organization_requests_path(@organization), notice: 'booking accepted'
    else
      redirect_to organization_requests_path(@organization), notice: 'booking could not be accepted - please try again'
    end
  end

  def decline
    authorize @booking

    if @booking.declined!
      redirect_to organization_requests_path(@organization), notice: 'booking rejected'
    else
      redirect_to organization_requests_path(@organization), notice: 'booking could not be rejected - please try again'
    end
  end

  def missed
    authorize @booking

    if @booking.missed!
      redirect_to organization_requests_path(@organization), notice: 'booking declined'
    else
      redirect_to organization_requests_path(@organization), notice: 'booking could not be declined - please try again'
    end
  end

  def concluded
    authorize @booking

    if @booking.concluded!
      redirect_to organization_requests_path(@organization), notice: 'booking concluded'
    else
      redirect_to organization_requests_path(@organization), notice: 'booking could not be set as concluded - please try again'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_organization
    set_booking
    @organization = @booking.project.organization
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :project_id)
  end
end
