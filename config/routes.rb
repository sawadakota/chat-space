Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :messages
  end
  root 'messages#index'
end
