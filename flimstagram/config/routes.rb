Rails.application.routes.draw do

  get 'comments/new'

  resources :posts do
    resources :comments
  end

  devise_for :users
  root 'posts#index'

  resources :tags

end
