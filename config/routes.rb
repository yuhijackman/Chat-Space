Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:index, :destroy, :show] do
    resources :chats, only: [:create,:index, :show]
  end
end
