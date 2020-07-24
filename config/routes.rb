Rails.application.routes.draw do
  # se agrega variable lessons
  resources :lessons
  
  devise_for :users
  
  resources :courses
  
  #se agrega ruta de user, para tener funcion de index, edit, show y update
  resources :users, only: [:index, :edit, :show, :update]
  
  get 'home/index'
  #se agrega ruta para declarar el home_activity_path
  
  get 'home/activity'
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
