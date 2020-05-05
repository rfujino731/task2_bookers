class ApplicationController < ActionController::Base
	
	#ログインユーザーのみ下記アクションが実行できる。
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
  	
	def after_sign_in_path_for(resource)
		users_path
	end

	def after_sign_out_path_for(resource)
		homes_path
	end

  	protected
 	def configure_permitted_parameters
 		added_attrs_1 = [ :email, :name, :password, :password_confirmation ]
    	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs_1
    	added_attrs_2 = [:name, :password, :password_confirmation]
    	devise_parameter_sanitizer.permit :sign_in, keys: added_attrs_2
  	end
end
