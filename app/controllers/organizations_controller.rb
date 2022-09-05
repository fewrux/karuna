class OrganizationsController < ApplicationController
  def show
    @organization = current_organization if current_organization.present?
    @organization = Organization.find_by(id: params[:id]) if current_organization.nil?
    authorize @organization
  end
end
