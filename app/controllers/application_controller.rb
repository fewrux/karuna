class ApplicationController < ActionController::Base
  before_action :authenticate_them

  
  protected

  def authenticate_them
    if user_signed_in?
      authenticate_user!
    elsif organization_signed_in?
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

  # before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
