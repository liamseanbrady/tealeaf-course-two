PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy]

  # get '/posts' to: 'posts#index'
  # post '/posts' to: 'posts#create'
  # get '/posts/new' to: 'posts#new'
  # get 'posts/:id/edit' to: 'posts#edit'
  # get 'posts/:id' to: 'posts#show'
  # patch 'posts/:id' to: 'posts#update'
  # delete 'posts/:id' to: 'posts#destroy'
end
