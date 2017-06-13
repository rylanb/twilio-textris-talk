Rails.application.routes.draw do
  root to: 'visitors#index'
  resources 'notifications', only: [:create]
end
