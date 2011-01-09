MarketingApp::Application.routes.draw do
  get "users/new"

  root :to => 'pages#home'

  match '/signup', :to => 'users#new'

  match '/more', :to => 'pages#more'
  match '/pricing', :to => 'pages#pricing'
  match '/contact', :to => 'pages#contact'
end
