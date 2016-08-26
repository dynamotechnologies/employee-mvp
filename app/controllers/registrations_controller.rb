class RegistrationsController < Devise::RegistrationsController

  layout 'registrations'
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:login_id, :last_name, :first_name, :street_address, :city,
    #                                                    :state, :zip, :cc_number, :cc_exp_date, :cvv, :security_answer])
  end


end