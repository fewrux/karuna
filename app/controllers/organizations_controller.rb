class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show projects requests]

  def show
    authorize @organization
  end

  def projects
    authorize @organization
    respond_to do |format|
      format.html
      format.text { render partial: "shared/organization_projects", locals: { organization: @organization }, formats: [:html] }
    end
  end

  def requests
    authorize @organization
    respond_to do |format|
      format.html
      format.text { render partial: "shared/organization_requests", locals: { organization: @organization }, formats: [:html] }
    end
  end

  private

  def set_organization
    @organization = current_organization if current_organization.present?
    @organization = Organization.find_by(id: params[:id]) if current_organization.nil?
    redirect_to root_path if @organization.nil?
  end
end
