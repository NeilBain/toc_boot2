Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end
  
  root to: 'visitors#index'
end
