class ApplicationController < ActionController::Base
  include FamiliesHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters , if: :devise_controller?																										
																										
  def configure_permitted_parameters																										
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin, :family_id])																					
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin])																										
    devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :name, :family_id) }
    devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :name, :family_id) }
  end	
  
  def default_url_options
    if Rails.env.production?
      {:host => "hidden-scrubland-42949.herokuapp.com/"}
    else  
      {}
    end
  end
end
