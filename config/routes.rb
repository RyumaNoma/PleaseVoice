Rails.application.routes.draw do
  # Apps
  get '/apps/new', to: 'apps#new'
  get '/apps/:id', to: 'apps#show'
  get '/apps/:id/edit', to: 'apps#edit'
  get '/apps', to: 'apps#index'
  post '/apps/new', to: 'apps#create'
  delete '/apps/destroy', to: 'apps#destroy'
  patch '/apps/:id/edit', to: 'apps#update'
  # Users
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/edit', to: 'users#edit'
  post '/signup', to: 'users#create'
  delete '/users/destroy/:id', to: 'users#destroy'
  patch '/users/update', to: 'users#update'
end
