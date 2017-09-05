Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources: :users, only: [:show, :index, :create, :update, :destroy]
      resources: :auth
      resources: :characters, only: [:create, :update, :destroy]
      resources: :scripts, only: [:show, :index, :create, :update, :destroy]
      resources: :versions, only: [:create, :show, :destroy]
      resources: :comments, only: [:show, :create, :update, :destroy]
      resources: :title_pages, only: [:show, :create, :update, :destroy]

      post '/auth', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/current_user', to: 'auth#verify'
      get '/me', to: 'auth#show'
    end
  end


end
