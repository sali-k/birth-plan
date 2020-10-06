Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root 'static_pages#home'
  get :about,         to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  resources :users, only: [:index, :show]
  resources :births
  resources :comments, only: [:create, :destroy]
end