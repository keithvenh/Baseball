Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/help'
  get 'home/help'
  devise_for :users
  root 'pages#home'
end
