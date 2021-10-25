Rails.application.routes.draw do
  get 'home', to: 'home#index' 
  get 'admin', to: 'books#index'
  devise_for :users
  resources :categories
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
