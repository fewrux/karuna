class UsersController < ApplicationController
  before_action :set_user, only: %i[show projects concluded skills badges]
  def show
    authorize @user
  end

  def projects
    authorize @user
    render_partial("cards")
  end

  def concluded
    authorize @user
    render_partial("concluded")
  end

  def skills
    authorize @user
    render_partial("skills")
  end

  def badges
    authorize @user
    render_partial("badges")
  end

  private

  def render_partial(content)
    respond_to do |format|
      format.html
      format.text { render partial: "shared/user_#{content}", locals: { user: @user }, formats: [:html] }
    end
  end

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
