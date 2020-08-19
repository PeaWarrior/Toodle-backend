Rails.application.routes.draw do
  # resources :images
  resources :users
  post '/images', to: 'images#create'
  get '/images/:id', to: 'images#show'
  post '/login', to: 'users#login'
  post '/signup', to: 'users#signup'
  patch '/images/:id', to: 'images#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
