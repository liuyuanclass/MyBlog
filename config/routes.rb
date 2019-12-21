Rails.application.routes.draw do

  resources :ads
  resources :admins
  resources :teachers
  resources :students
  resources :clients
  resources :lists
  devise_for :users


  root to: "home#index"




end
