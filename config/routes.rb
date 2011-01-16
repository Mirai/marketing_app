MarketingApp::Application.routes.draw do
  root :to => 'pages#home'

  match '/signup', :to => 'users#new'

  resources :users, :user_sessions#, :contacts, :faqs

  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'

  match '/more', :to => 'pages#more'
  match '/pricing', :to => 'pages#pricing'
  match '/contact', :to => 'pages#contact'

  namespace :admin do
    resources :users
    resources :contacts
    resources :faqs
    resources :user_sessions
  end

  match '/admin/login', :to => 'admin/user_sessions#new'
  match '/admin/logout', :to => 'admin/user_sessions#destroy'
  match '/admin', :to => 'admin/pages#home'
end
