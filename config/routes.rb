Rails.application.routes.draw do
  
  # session management
  get 'welcome/index'
  get '/login', to: 'welcome#login'
  post '/login', to: 'welcome#create'
  delete '/logout', to: 'welcome#destroy'

  # signup
  get 'signup', to: 'users#new'
  
  # appliacation's root
  root 'welcome#index'

  # users
  resources :users

  # posts
  resources :posts do
    resources :comments do
      resources :responses
    end
  end

end
