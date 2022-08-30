class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def create
    @user.user = current_user.id
end
