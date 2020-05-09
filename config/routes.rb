Rails.application.routes.draw do
  root 'homes#show' ,as: 'show_home' 
  devise_for :users

  get "about" => "homes#about" , as: 'about_home'

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'homes' => 'homes#show'

  resources :users, only: [:show, :edit, :update, :index, :create]
  resources :books, only: [:new, :create, :show, :edit, :update, :index, :destroy]

  resources :homes
end
