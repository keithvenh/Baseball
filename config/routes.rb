Rails.application.routes.draw do
  get 'teams/index'
  get 'leagues/index'
  get 'pages/home'
  get 'pages/help'
  get 'home/help'
  devise_for :users
  root 'pages#home'
  get 'all-players', to: 'players#index', as: '/all-players'
  get 'my-players', to: 'players#user_players'
end
