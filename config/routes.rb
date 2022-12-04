Rails.application.routes.draw do
  resources :comments do
    collection do
      get 'reply_to', defaults: { format: :json }
    end
  end
  resources :listuserlikedbooks
  resources :listbookgenres
  resources :listbookauthors
  resources :books do
    get 'search', on: :collection, to: 'books#search'
  end
  resources :authors
  get 'session/login'
  get 'session/create'
  get 'session/logout'
  resources :users
  resources :genres
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'books#index'
end
