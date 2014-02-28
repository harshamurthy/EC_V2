class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_gym!
  before_filter :set_timezone

  protected


def set_timezone
  Time.zone = 'Central Time (US & Canada)'
end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:location, :email]
    devise_parameter_sanitizer.for(:sign_in) << :location
  end
end
