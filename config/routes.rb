Fss::Application.routes.draw do
  resources :stores
  resources :units
  resources :producers
  resources :stocks
  resources :foods

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end