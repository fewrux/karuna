class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show projects messages requests]

  def show
    authorize @organization
  end

  def projects
    authorize @organization
    respond_to do |format|
      format.html
      format.text { render partial: "organizations/organization_project_cards", locals: { organization: @organization }, formats: [:html] }
    end
  end

  def messages
    authorize @organization
    respond_to do |format|
      format.html
      format.text { render partial: "organizations/organization_messages", locals: { organization: @organization }, formats: [:html] }
    end
  end

  def requests
    authorize @organization
    respond_to do |format|
      format.html
      format.text { render partial: "organizations/organization_requests", locals: { organization: @organization }, formats: [:html] }
    end
  end

  private

  def other_or_no_organization
    @organization != current_organization || current_organization.nil?
  end

  def set_organization
    if other_or_no_organization
      @organization = Organization.find_by(id: params[:id])
    elsif current_organization
      @organization = current_organization
    end
    redirect_to root_path if @organization.nil?
  end
end
