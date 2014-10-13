Blog::Application.routes.draw do

  resources :comments
  resources :posts

  resources :users, :only => [:update, :show] do
    collection do
      get 'edit'
    end
  end

  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
