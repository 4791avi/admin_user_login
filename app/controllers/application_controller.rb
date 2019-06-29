class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :after_sign_in_path_for(current_user)



# def after_sign_in_path_for(resource)
#   if resource.is_a?(User) && resource.banned?
#     sign_out resource
#     banned_user_path
#   else
#    super
#   end
# end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company_name, :phone])
  end	
end
