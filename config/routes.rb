Rails.application.routes.draw do
  
  get 'welcome/index'
  get 'welcome/login'
  post 'welcome/create'
 
  root 'welcome#index'

  resources :users do
    resources :posts do
      resources :comments do
        resources :responses
      end
    end
  end

end
