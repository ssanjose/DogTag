Rails.application.routes.draw do
  root to: "main#index"
  get "about", to: "main#about"

  post "dog/search", to: "dog#search"
  resources :dog, only: %i[index show]

  resources :owner, only: %i[index show]

  resources :breed, only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
