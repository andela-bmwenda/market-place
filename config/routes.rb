Rails.application.routes.draw do
  get 'users', to: 'users#index'
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  get 'users/:id', to: 'users#show'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
end
