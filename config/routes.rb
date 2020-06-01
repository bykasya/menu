Rails.application.routes.draw do
  resources :menu_planners
  get 'home/index'
  resources :dishes_ingredients
  resources :dishes
  resources :ingredients
  root 'home#index'
  get '/menu_planners/new/newweek', to: 'menu_planners#newweek'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
