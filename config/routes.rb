Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'

  post "favorites/:question_id/create" => "favorites#create"
  post "favorites/:question_id/destroy" => "favorites#destroy"
  
  resources :questions do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
end
