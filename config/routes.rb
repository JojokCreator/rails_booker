Rails.application.routes.draw do
  devise_for :users
  resources :bookings
    get 'home/index'
    get 'bookings/index'
    
    root 'pages#home'


end
