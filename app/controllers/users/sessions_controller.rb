# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  include Accessible
  skip_before_action :check_user, only: :destroy
  skip_before_action :check_user, only: :new, unless: :storable_location?

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[first_name last_name age gender document country about])
  end
end
