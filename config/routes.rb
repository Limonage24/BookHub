Rails.application.routes.draw do
  resources :comments, only: %i[create update destroy]
  resources :books do
    get 'search', to: 'books#search', on: :collection
    member do
      post 'like', to: 'books#like_book'
      post 'read', to: 'books#read_book'
    end
  end
  resources :authors
  get 'session/login'
  get 'session/create'
  get 'session/logout'
  resources :users do
    member do
      get 'liked_books', to: 'users#show_liked_books'
      get 'read_books', to: 'users#show_read_books'
    end
  end
  resources :genres
  get 'export/export_db'
  get 'rules', to: 'books#rules'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'books#index'
end
