DeviseRolesUserManagement::Application.routes.draw do
  #devise_for :users, :controllers => {:registrations => "registrations"} 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :token_authentications, :only => [:create, :destroy]
  resources :user, :controller => "user"
  root :to => "dashboard#index"
  get "welcome/index"
  get "welcome/test"
  get "welcome/sample_ajax"

end
