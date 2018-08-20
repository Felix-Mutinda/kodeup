Rails.application.routes.draw do
  
  # session management
  get 'welcome/index'
  get 'welcome/login'
  post 'welcome/create'
  delete 'welcome/destroy'
  
  # appliacation's root
  root 'welcome#login'

  # users
  resources :users

  # posts
  resources :posts do
    resources :comments do
      resources :responses
    end
  end

end
