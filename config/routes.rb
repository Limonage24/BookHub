Rails.application.routes.draw do
  get 'export/export_db'
  resources :comments, only: %i[create update destroy]
  resources :books do
    collection do
      get 'search', to: 'books#search'
      post 'like', to: 'books#like_book'
      post 'read', to: 'books#read_book'
    end
  end
  resources :authors
  get 'session/login'
  get 'session/create'
  get 'session/logout'
  resources :users do
    collection do
      get 'liked_books', to: 'users#show_liked_books'
      get 'read_books', to: 'users#show_read_books'
    end
  end
  resources :genres
  get 'export/export_db'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'books#index'
end
