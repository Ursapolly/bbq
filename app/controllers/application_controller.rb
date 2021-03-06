class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_parameters_for_reg, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :user_can_subscribe?
  helper_method :user_subscribed?

  def configure_parameters_for_reg
    devise_parameter_sanitizer.permit(
        :sign_up,
        keys: [:email, :name, :password]
    )
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
        :account_update,
        keys: [:password, :password_confirmation, :current_password]
    )
  end

  def current_user_can_edit?(model)
    user_signed_in? && (
    model.user == current_user ||
        (model.try(:event).present? && model.event.user == current_user)
    )
  end

  def user_can_subscribe?(event)
    event.user != current_user
  end

  def user_subscribed?
    true if Subscription.where(user: current_user).exists? && user_signed_in?
  end
end