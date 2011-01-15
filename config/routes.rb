MarketingApp::Application.routes.draw do
  root :to => 'pages#home'

  match '/signup', :to => 'users#new'
  resources :users

  resources :user_sessions
  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'

  match '/more', :to => 'pages#more'
  match '/pricing', :to => 'pages#pricing'
  match '/contact', :to => 'pages#contact'
end
