class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show projects messages requests]

  def show
    authorize @organization
  end

  def projects
    authorize @organization
    render_partial("project_cards")
  end

  def messages
    authorize @organization
    render_partial("messages")
  end

  def requests
    authorize @organization
    render_partial("requests")
  end

  private

  def render_partial(content)
    respond_to do |format|
      format.html
      format.text { render partial: "organizations/organization_#{content}", locals: { organization: @organization }, formats: [:html] }
    end
  end

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
