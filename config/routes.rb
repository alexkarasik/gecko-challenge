Rails.application.routes.draw do
  resources :customers do
    collection { post :import }
  end
  root :to => 'customers#index'
  post "/" => 'customers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
