Rails.application.routes.draw do
  resources :shows
  resources :users
  # resources :sessions
  get 'home', to: 'users#welcome'
  get 'user/delete/:id', to: 'users#destroy', as: 'delete_account'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get '/delete/fav/:id', to: 'favorites#destroy', as: 'delete_fav'
  get '/add/:id', to: 'favorites#add', as: 'add'
  get '/users/favs/:id', to: 'users#favs', as: 'user_favs'
  get '/users/recommended/:id', to:'users#recommended', as: 'user_recommended'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
