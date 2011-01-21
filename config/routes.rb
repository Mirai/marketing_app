MarketingApp::Application.routes.draw do
  get "faqs/index"

  root :to => 'pages#home'

  match '/signup', :to => 'users#new'

  resources :users, :user_sessions, :faqs, :contacts

  match '/contact_us', :to => 'contacts#new'

  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'

  match '/more', :to => 'pages#more'
  match '/pricing', :to => 'pages#pricing'
  match '/thank_you', :to => 'pages#thank_you'

  namespace :admin do
    resources :users
    resources :contacts do
      collection do
        post :mark_responded
      end
    end
    resources :faqs do
      collection do
        post :reorder
      end
    end
    resources :user_sessions
  end

  match '/admin/login', :to => 'admin/user_sessions#new'
  match '/admin/logout', :to => 'admin/user_sessions#destroy'
  match '/admin', :to => 'admin/pages#home'
end
