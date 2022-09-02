class BookingsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.project = @project
    @booking.status = 0

    authorize @booking

    if @booking.save
      redirect_to @current_user, notice: "Booking created"
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :project_id)
  end
end
