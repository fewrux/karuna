class BookingsController < ApplicationController


  def create
    @project = Project.find(params[:project_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user
    @booking.project_id = @project

    authorize @booking
    if @booking.save
      redirect_to project_path(@project), notice: "Booking created"
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :project_id)
  end

end
