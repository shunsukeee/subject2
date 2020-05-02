Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, :only => [:show, :index, :edit, :update]
  resources :books, :onry => [:show, :index, :create, :edit, :update, :delete]
end
