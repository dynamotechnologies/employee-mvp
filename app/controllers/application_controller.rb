class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
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

  def authenticate_admin!
    unless current_employee && current_employee.is_admin
      redirect_to root_path
    end
  end
end
