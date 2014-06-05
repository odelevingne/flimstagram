Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  get 'comments/new'

  resources :posts do
    resources :comments
    resources :likes do
    	collection do
    		delete :destroy
    	end
    end
  end

  root 'posts#index'

  resources :tags
  resources :orders

end
