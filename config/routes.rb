Rails.application.routes.draw do
  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Replies
  get '/send_reply/:app_id', to: 'replies#new'
  post '/send_reply/:app_id', to: 'replies#create'
  patch '/replies/destroy/:id', to: 'replies#destroy'
  # Apps
  get '/apps/new', to: 'apps#new'
  get '/apps/:id', to: 'apps#show'
  get '/apps/:id/edit', to: 'apps#edit'
  get '/apps', to: 'apps#index'
  post '/apps/new', to: 'apps#create'
  delete '/apps/destroy/:id', to: 'apps#destroy'
  patch '/apps/:id/edit', to: 'apps#update'
  # Users
  get '/signup', to: 'users#new'
  get '/users/edit', to: 'users#edit'
  get '/users/:id', to: 'users#show'
  get '/users/edit', to: 'users#edit'
  post '/signup', to: 'users#create'
  delete '/users/destroy/:id', to: 'users#destroy'
  patch '/users/update', to: 'users#update'
  # Main
  root 'apps#index'
end
