Rails.application.routes.draw do
  root "meal_plans#index"

  resources :food_items
  resources :recipes do
    resources :ingredients
  end
  resources :meal_plans do
    resources :meals
  end
end
