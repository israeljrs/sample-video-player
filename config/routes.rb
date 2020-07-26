Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
    get "index", to: "sessions#dashbord", as: "dashbord"
    get "home", to: "sessions#dashbord", as: "home"
    resources :movies do
      post "search", on: :collection
      get "search", on: :collection
    end
    resources :users do
      post "search", on: :collection
      get "search", on: :collection
    end
  end
  root 'welcome#index'
  post 'player/views', to: 'welcome#views'

end
