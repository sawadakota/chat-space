Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :messages
  end
  root 'groups#index'
  get '/users/search/:name', to: 'users#search'
end
