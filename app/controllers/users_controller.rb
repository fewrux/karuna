class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def show
    authorize @user
  end

  private

  def other_or_no_user
    @user != current_user || current_user.nil?
  end

  def set_user
    if other_or_no_user
      @user = User.find_by(id: params[:id])
    elsif current_user
      @user = current_user
    end
    redirect_to root_path if @user.nil?
  end
end
