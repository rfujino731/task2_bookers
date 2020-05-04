class ApplicationController < ActionController::Base
	
	#ログインユーザーのみ下記アクションが実行できる。
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
  	protected
 	def configure_permitted_parameters
 		added_attrs = [ :email, :name, :password, :password_confirmation ]
    	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    	devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  	end
end
