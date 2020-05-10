Rails.application.routes.draw do
  root to: 'homes#show' 

  # ,as: 'show_home'
  devise_for :users

  get "about" => "homes#about" , as: 'about_home'

  resources :homes, only: [:show, :edit, :update, :index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'homes' => 'homes#show'

  resources :users, only: [:show, :edit, :update, :index, :create]
  resources :books, only: [:new, :create, :show, :edit, :update, :index, :destroy]

  resources :homes
end
