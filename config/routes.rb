Rails.application.routes.draw do
  root "meal_plans#index"

  resources :food_items
  resources :recipes do
    resources :ingredients
  end
  resources :meal_plans do
    resources :meal_plan_days
    resource :shopping_list
  end
  resources :meal_plan_days do
    resources :meals
  end
end
