Rails.application.routes.draw do
	devise_for :doctors, controllers: {
		sessions: "doctors/sessions",
		registrations: "doctors/registrations",
	}
	devise_for :patients, controllers: {
		sessions: "patients/sessions",
		registrations: "patients/registrations",
	}

	# patient pages
	get "/patients/dashboard", to: "patients#dashboard"
    get "/patients/appointments", to: "patients#appointments"
    get "/patients/treatments", to: "patients#treatments"

	# doctor pages
	get "/doctors/dashboard", to: "doctors#dashboard"

	root "home#index"
end
