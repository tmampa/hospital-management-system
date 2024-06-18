Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
  get '/patients/payments', to: 'patients#payments'
  get '/patients/treatments/:id/export_pdf', to: 'patients#export_treatments_pdf', as: 'export_treatment_pdf'

  authenticated :patient do
    root 'patients#dashboard', as: :patient_root
  end

  # doctor pages
  get '/doctors/dashboard', to: 'doctors#dashboard'
  get '/doctors/appointments', to: 'doctors#manage_appointments'
  get '/doctors/treatments', to: 'doctors#manage_treatments'

  # appointment pages
  post '/appointments/create', to: 'appointments#create_appointment'
  delete '/appointments/:id', to: 'appointments#destroy'
  # patch "/appointments/:id/update_status", to: "appointments#update_status"

  authenticated :doctor do
    root 'doctors#dashboard', as: :doctor_root
  end

  resources :appointments do
    member do
      patch :update_status
    end
  end

  post '/treatments/create_treatment', to: 'treatments#create_treatment', as: :treatments_create_treatment

  resources :treatments do
    resources :payments, only: [:new, :create]
  end

  resources :ratings
  root 'home#index'
end
