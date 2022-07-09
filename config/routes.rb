Rails.application.routes.draw do
  devise_for :users
  resources :shows
  
  get "home/about"
  root "shows#index"

end
