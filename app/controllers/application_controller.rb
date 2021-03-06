class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # Method to allow saving custom fields with devise user model
  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name) }
    if resource_class == User
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name) }
    elsif resource_class == Company
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :details) }
    else
        super
    end
  end

  def authenticate!
    :authenticate_user! || :authenticate_company!
  end

  alias_method :devise_current_user, :current_user
  def current_user
    devise_current_user || current_company
  end

end
