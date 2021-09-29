Rails.application.routes.draw do
  resources :menu_planners
  get 'home/index'
  resources :dishes
  resources :ingredients, :except => [:new, :show]
  root 'home#index'
  get '/menu_planners/new/newweek', to: 'menu_planners#newweek'
end
