Rails.application.routes.draw do
root 'chats#index'
get 'chats/:id' => 'chats#show'
end
