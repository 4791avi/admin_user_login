Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_scope :user do
	  authenticated :user do
	  get '/users/sign_out' => 'devise/sessions#destroy'
	  root 'dashboard#index', as: :authenticated_root
	  end
	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end  
  # root to: 'dashboard#index'
end
