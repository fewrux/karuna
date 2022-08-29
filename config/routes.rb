Rails.application.routes.draw do
  devise_for :organizations
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, path: 'users', controllers: { confirmations: "users/confirmations",
                                                   omniauth_callbacks: "users/omniauth_callbacks",
                                                   passwords: "users/passwords",
                                                   registrations: "users/registrations",
                                                   sessions: "users/sessions",
                                                   unlocks: "users/unlocks" }

  devise_for :organizations, path: 'organizations', controllers: { confirmations: "organizations/confirmations",
                                                                   omniauth_callbacks: "organizations/omniauth_callbacks",
                                                                   passwords: "organizations/passwords",
                                                                   registrations: "organizations/registrations",
                                                                   sessions: "organizations/sessions",
                                                                   unlocks: "organizations/unlocks" }
end
