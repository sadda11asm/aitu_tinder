Rails.application.routes.draw do

  post 'sign_up', to: 'hacknu_users#sign_up'
  get 'get_liked_users', to: 'hacknu_users#get_liked_by_users'

  resources :hacknu_conversations
  resources :tags
  resources :topic_rooms
  resources :topic_tags
  resources :topics
  resources :hacknu_likes
  resources :hacknu_preferences
  resources :hacknu_images
  resources :hacknu_users
  resources :orders


  # resources :clients
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

end
