Rails.application.routes.draw do
  # Users
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/edit', to: 'users#edit'
  post '/signup', to: 'users#create'
  delete '/users/destroy/:id', to: 'users#destroy'
  patch '/users/update', to: 'users#update'
end
