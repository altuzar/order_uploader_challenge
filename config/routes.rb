Rails.application.routes.draw do
  resources :order_uploads
  resources :order_summaries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
