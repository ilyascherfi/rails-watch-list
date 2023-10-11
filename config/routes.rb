Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'lists#index'
  resources :lists, except: [:index] do
    resources :bookmarks, only: %i[create new]
    resources :reviews, only: %i[create new]
  end
  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
end
