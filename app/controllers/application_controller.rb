class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = I18n.t "pundit.#{policy_name}.#{exception.query}"
    redirect_to(request.referrer || root_path)
  end

  protected

  def sign_up_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :first_name, :last_name, :email, :password,
               :password_confirmation, :remember_me)
    end
  end

  def login_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password, :remember_me)
    end
  end

  def account_update_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :first_name, :last_name, :email, :password,
               :password_confirmation, :current_password)
    end
  end

  def configure_permitted_parameters
    sign_up_permitted_parameters
    login_permitted_parameters
    account_update_permitted_parameters
  end
end
