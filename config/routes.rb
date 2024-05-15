Rails.application.routes.draw do
  devise_for :doctors
  devise_for :patients, controllers: {
    sessions: "patients/sessions",
    registrations: "patients/registrations",
  }


  # patient pages
    get "/patients/dashboard", to: "patients#dashboard"

  root "home#index"
end
