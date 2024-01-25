Rails.application.routes.draw do

  # %i[index show] == [:index, :show]
  resources :gardens, only: %i[index show] do
    resources :plants, only: :create
  end

  # Previously, we had #destroy included within our nested plants resources, but
  # we can moved this to its own resources because the destroy method will already be able to
  # identify/query for the specific plant to destroy thanks to its ID.
  resources :plants, only: :destroy
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
