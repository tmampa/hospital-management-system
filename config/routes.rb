Rails.application.routes.draw do
  namespace :admin do
    resources :appointments
    resources :doctors
    resources :patients
    resources :treatments

    root to: 'appointments#index'
  end
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations'
  }

  # patient pages
  get '/patients/dashboard', to: 'patients#dashboard'
  get '/patients/appointments', to: 'patients#appointments'
  get '/patients/treatments', to: 'patients#treatments'

  # doctor pages
  get '/doctors/dashboard', to: 'doctors#dashboard'
  get '/doctors/appointments', to: 'doctors#manage_appointments'
  get '/doctors/treatments', to: 'doctors#manage_treatments'

  # appointment pages
  post '/appointments/create', to: 'appointments#create_appointment'
  # patch "/appointments/:id/update_status", to: "appointments#update_status"

  resources :appointments do
    member do
      patch :update_status
    end
  end

  post '/treatments/create_treatment', to: 'treatments#create_treatment', as: :treatments_create_treatment

  root 'home#index'
end
