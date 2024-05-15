Rails.application.routes.draw do
  devise_for :patients
  root "home#index"
end
