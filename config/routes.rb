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

  resources :projects, only: %i[index new create]
end
