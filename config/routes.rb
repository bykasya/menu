Rails.application.routes.draw do
  get 'home/index'
  resources :dishes_ingredients
  resources :dishes
  resources :ingredients
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
