Rails.application.routes.draw do
  root 'homes#show' ,as: 'show_home' 
  devise_for :users

  get "about" => "homes#about" , as: 'about_home'

  #ログイン後、一覧画面(index)に移動
  #deviseではログイン認証後、成功すれば、rootパスにリダイレクトされる


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'homes' => 'homes#show'

  resources :users, only: [:show, :edit, :update, :index, :create]
  resources :books, only: [:new, :create, :show, :edit, :update, :index, :destroy]

  resources :homes
end
