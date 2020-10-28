class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end

  def password_logged_in?
    current_user.present?
  end
end
