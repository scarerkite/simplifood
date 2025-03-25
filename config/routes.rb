Rails.application.routes.draw do
  get "/home", to: "home#index"
  root "home#index"

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [ :index, :show ]
    end
  end

  # Client-side routing fallback
  get "*path", to: "home#index", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
