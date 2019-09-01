Rails.application.routes.draw do
  
  #get 'comments/destroy'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'pages#index'
	get 'pages/help'
	
	get 'topics/index'
	
	resources :users
	resources :topics
	resources :comments
	
	
	get 'favorites/index'
	post '/favorites', to: 'favorites#create'
	delete '/favorite', to: 'favorites#destroy'
	
	
	get		 '/login',	to: 'sessions#new'
	post	 '/login',	to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
end
