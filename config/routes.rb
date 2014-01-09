Fss::Application.routes.draw do
  resources :stocks

  resources :foods

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end