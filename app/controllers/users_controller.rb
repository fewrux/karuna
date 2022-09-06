class UsersController < ApplicationController
  def show
    @user = current_user if current_user.present?
    @user = User.find_by(id: params[:id]) if current_user.nil?
    authorize @user
  end

end
