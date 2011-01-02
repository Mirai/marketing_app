MarketingApp::Application.routes.draw do
  root :to => 'pages#home'

  match '/more', :to => 'pages#more'
  match '/pricing', :to => 'pages#pricing'
  match '/contact', :to => 'pages#contact'
end
