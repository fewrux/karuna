class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show projects requests]

  def show
    authorize @organization
  end

  def projects
    authorize @organization
  end

  def requests
    authorize @organization
  end

  private

  def set_organization
    @organization = current_organization if current_organization.present?
    @organization = Organization.find_by(id: params[:id]) if current_organization.nil?
    redirect_to root_path if @organization.nil?
  end
end
