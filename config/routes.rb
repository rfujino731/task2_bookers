Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ログイン後、一覧画面(index)に移動
  #deviseではログイン認証後、成功すれば、rootパスにリダイレクトされる
  root 'users#show'

  # get 'homes' => 'homes#show'

  resources :users, only: [:show, :edit, :update]

  resources :homes, only: [:new, :create, :index, :show]
end
