Rails.application.routes.draw do
  root to: "home#index"
  get "/search", to: "movies#search", as: "search"
  resources :movie_crews
  resources :movie_casts
  resources :movies
  resources :categories

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
