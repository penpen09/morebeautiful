class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    events_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end


end
