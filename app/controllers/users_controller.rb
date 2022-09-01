class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user

    @bookings = @user.bookings
    @projects = @user.projects
  end

  def create
    @user.user = current_user.id
  end
end
