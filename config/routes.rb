Rails.application.routes.draw do
  root "recipes#index"

  resources :food_items
  resources :recipes do
    resources :ingredients
  end
end
