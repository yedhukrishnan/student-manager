class ApplicationController < ActionController::Base
	
	protected

	def after_sign_in_path_for(resource)
		pages_home_url
	end

	def after_sign_up_path_for(resource)
		pages_home_url
	end
end
