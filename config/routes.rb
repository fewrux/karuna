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

  resources :projects do
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

  # User Routes

  resources :users, only: %i[show]

  get "users/:id/projects", to: "users#projects", as: "user_projects"

  get "users/:id/concluded", to: "users#concluded", as: "user_concluded"

  get "users/:id/skills", to: "users#skills", as: "user_skills"

  get "users/:id/badges", to: "users#badges", as: "user_badges"

  # Organization Routes

  resources :organizations, only: %i[show]

  get "organizations/:id/projects", to: "organizations#projects", as: "organization_projects"

  get "organizations/:id/concluded", to: "organizations#concluded", as: "organization_concluded"

  get "organizations/:id/requests", to: "organizations#requests", as: "organization_requests"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
