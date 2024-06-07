Rails.application.routes.draw do


#  scope :admin do
  resources :site_settings
  get 'site/home'
  get 'site/map'
  get 'sites' => 'site_settings#index'
  get 'site/google_tag'

  get 'makes/:slug/pick' => 'makes#pick', param: :slug, as: :make_pick

  resources :makes, param: :slug do
    resources :instruments
  end

  get 'dashboard/index'
  get 'dashboard' => 'dashboard#index'
  resources :flickr_photos

  patch 'instruments/:id/assign_flickr_photo' => 'instruments#update', as: :assign_flickr_photo

  resources :icons
  resources :instruments do
    resources :flickr_photos do
      match :remove, via: [:get, :post]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "site#home"

  get 'categories' => 'categories#index', as: 'categories'
  post 'categories' => 'categories#create'

  resources :categories, except: [:index, :create], param: :slug, path: '/' do
    resources :makes, param: :slug
  end
#  end # scope admin
end
