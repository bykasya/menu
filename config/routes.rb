Rails.application.routes.draw do
  resources :dishes_ingredients
  resources :dishes
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
