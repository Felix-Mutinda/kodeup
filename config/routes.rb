Rails.application.routes.draw do
  
  resources :users do
    resources :posts do
      resources :comments do
        resources :responses
      end
    end
  end
end
