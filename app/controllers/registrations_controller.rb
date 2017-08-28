class RegistrationsController < Devise::RegistrationsController


  protected
  def after_sign_up_path_for(resource)
    dashboard_profile_complete_path
  end
end
