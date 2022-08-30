class ApplicationController < ActionController::Base
  before_action :authenticate_them

  protected

  def authenticate_them
    if users_user_signed_in?
      authenticate_user!
    elsif organizations_organization_signed_in?
      authenticate_organization!
    end
  end

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   elsif resource_class == Organization
  #     Organization::ParameterSanitizer.new(Organization, :organization, params)
  #   else
  #     super
  #   end
  # end
end
