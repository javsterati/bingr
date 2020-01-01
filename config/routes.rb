Rails.application.routes.draw do
  resources :shows
  resources :users
  # resources :sessions
  get '/', to: 'users#index'
  get 'user/delete/:id', to: 'users#destroy', as: 'delete_account'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/delete/fav/:id', to: 'favorites#destroy', as: 'delete_fav'
  get '/add/:id', to: 'favorites#add', as: 'add'
  get '/users/favs/:id', to: 'users#favs', as: 'user_favs'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
