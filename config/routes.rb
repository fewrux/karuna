Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, path: 'users', controllers: { confirmations: "users/confirmations",
                                                   passwords: "users/passwords",
                                                   registrations: "users/registrations",
                                                   sessions: "users/sessions",
                                                   unlocks: "users/unlocks" }

  devise_for :organizations, path: 'organizations', controllers: { confirmations: "organizations/confirmations",
                                                                   passwords: "organizations/passwords",
                                                                   registrations: "organizations/registrations",
                                                                   sessions: "organizations/sessions",
                                                                   unlocks: "organizations/unlocks" }

  resources :projects, only: %i[index show new create] do
    resources :bookings
  end

  resources :bookings, only: [] do
    member do
      get :accept
      get :decline
      get :concluded
      get :missed
    end
  end

  resources :users, only: %i[show]

  get "test", to: "pages#test"
  resources :organizations, only: %i[show]

<<<<<<< HEAD
=======
  get "organizations/:id/projects", to: "organizations#projects", as: "organization_projects"

  get "organizations/:id/requests", to: "organizations#requests", as: "organization_requests"
>>>>>>> master
end
