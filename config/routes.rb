Rails.application.routes.draw do
  root "home#index"

  resources :food_items
  resources :meals
  resources :recipes do
    resources :ingredients
  end
  resources :meal_plans do
    resources :meal_plan_days
    resources :shopping_basket_items
  end
  resources :meal_plan_days do
    resources :meals
  end
  post '/meal_plan_days/:id/copy', to: 'meal_plan_days#copy', as: 'copy_meal_plan_day'
end
