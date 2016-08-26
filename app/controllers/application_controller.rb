class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def layout_by_resource
    if devise_controller?
      'registrations'
    else
      'application'
    end
  end
end
