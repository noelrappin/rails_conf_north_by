Rails.application.routes.draw do
  resource :schedule
  resources :ticket_orders
  resources :tickets
  resources :gigs
  resources :concerts
  resources :bands
  resources :venues
  devise_for :users

  root to: "schedules#show"
end
