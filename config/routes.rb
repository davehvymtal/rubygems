Rails.application.routes.draw do
  devise_for :users
  resources :courses
  #se agrega ruta de user index
  resources :users
  get 'home/index'
  #se agrega ruta para declarar el home_activity_path
  get 'home/activity'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
