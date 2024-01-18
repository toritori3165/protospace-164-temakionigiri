Rails.application.routes.draw do
  root to: 'prototypes#index'
  resources :prototyps
end
