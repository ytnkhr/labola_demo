Rails.application.routes.draw do


  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 

  root 'home#top'
  resources :users, :only => [:show, :index]
  resources :blogs , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :recruits , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :teams , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :team_entries , :only => [:new, :create]
  post "team_entries/:id/accept" => "team_entries#accept"
  post "team_entries/:id/reject" => "team_entries#reject"
  get  "messages/:id/new" => "messages#new"
  resources :messages, :only => [:create]
  get  "chats/:id/new" => "chats#new"
  resources :chats, :only => [:create]
  post "likes/:id/create" => "likes#create"
  resources :likes , :only => [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
