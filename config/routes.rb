Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  resources :groups, except: [:index, :destroy] do
    resources :chats, only: [:create, :index]
  end
end
