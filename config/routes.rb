Rails.application.routes.draw do
  resources :posts
  devise_for :users ,:controllers => {:registrations => "registrations",
   :omniauth_callbacks => "omniauth_callbacks"  }
  devise_scope :user do
  root :to => 'devise/sessions#new'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
