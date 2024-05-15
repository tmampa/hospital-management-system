Rails.application.routes.draw do
  devise_for :patients, controllers: {
    sessions: "patients/sessions",
    registrations: "patients/registrations",
  }
  root "home#index"
end
