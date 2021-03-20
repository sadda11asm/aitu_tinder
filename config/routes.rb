Rails.application.routes.draw do
  resources :hacknu_conversations
  resources :hacknu_tags
  resources :hacknu_topic_rooms
  resources :hacknu_topic_tags
  resources :hacknu_topics
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
