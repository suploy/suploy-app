class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :token_authenticate_user!
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, if: :token_auth?
  #rescue_from CanCan::AccessDenied, with: :permission_denied

  private

  def permission_denied
    render json: {error: t("devise.failure.invalid")}, status: :forbidden
  end

  def invalid_authentication
    render json: {error: t("devise.failure.invalid")}, status: :unauthorized
  end

  def unauthenticated
    render json: {error: t("devise.failure.unauthenticated")}, status: :unauthorized
  end

  def token_authenticate_user!
    if valid_token_auth?
      sign_in current_session_token.user, store: false
      current_user.token_authed = true
    end
  end

  def valid_token_auth?
    token_auth_possible_and_necessary? && current_session_token.user && current_session_token.valid?
  end

  def token_auth_possible_and_necessary?
    !user_signed_in? && !authorization_header.blank?
  end

  def current_session_token
    @current_session_token ||= AuthenticationToken.new(authorization_header)
  end

  def token_auth?
    !authorization_header.nil?
  end

  def authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
