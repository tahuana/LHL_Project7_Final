Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  get 'home/index'
  root 'home#index'

  resources :users do
    resources :archive, :only => [:index]
  end
  resources :skills, :only => [:create, :destroy]
  resources :feeds, :only => [:create]
  resources :sessions, :only => [:create, :destroy]
  resources :projects do
    resources :goals, :only => [:create, :destroy, :update]
    resources :comments, :only => [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/authenticate' => 'authenticate#index'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
