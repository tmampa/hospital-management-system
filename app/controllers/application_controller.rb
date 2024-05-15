class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		if resource.is_a?(Patient)
			patients_dashboard_path
		else
			doctors_dashboard_path
		end
	end
end
