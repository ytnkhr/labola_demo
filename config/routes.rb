Rails.application.routes.draw do

  get 'likes/create'

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 

  root 'home#top'
  resources :users, :only => [:show, :index]
  resources :blogs , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :likes , :only => [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
