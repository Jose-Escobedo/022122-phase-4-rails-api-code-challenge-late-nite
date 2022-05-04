Rails.application.routes.draw do
  resources :episodes, only: [:index, :show, :destroy]
  resources :appearances, only: [:create]
  resources :guests, only: [:index]
end
