Rails.application.routes.draw do

  resources :makes, param: :slug do
    resources :instruments
  end
  get 'dashboard/index'
  get 'dashboard' => 'dashboard#index'
  resources :flickr_photos
  resources :icons
  resources :instruments do
    resources :flickr_photos
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "instruments#index"

  get 'categories' => 'categories#index', as: 'categories'
  resources :categories, except: [:index], param: :slug, path: '/' do
    resources :makes, param: :slug do
      resources :instruments
    end
  end
end
