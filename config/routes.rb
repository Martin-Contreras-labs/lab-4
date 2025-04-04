Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create] do
    resources :conversations, only: [:index]
  end
  
  resources :conversations, only: [:create, :show] do
    resources :messages, only: [:create]
  end

  delete "/delete_all_users", to: "admin#delete_all_users", as: :delete_all_users
  delete "/delete_all_chats", to: "admin#delete_all_chats", as: :delete_all_chats

  
  root 'users#index'
end

