class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == Organization
      Organization::ParameterSanitizer.new(Organization, :organization, params)
    else
      super
    end
  end
end
