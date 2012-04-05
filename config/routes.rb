PianoDB::Application.routes.draw do
  devise_for :users

  #devise_for :users, :controllers => { :sessions => 'sessions' }
  devise_scope :user do
    match '/login'          => 'devise/sessions#new',     :as => 'login'
    match '/users/sign_in'  => 'devise/sessions#new'
    match '/users/sign_out' => 'devise/sessions#destroy', :as => 'sign_out'
    match '/logout'         => 'devise/sessions#destroy', :as => 'logout'
  end

  namespace :admin do
    resources :people
  end

  #   match 'products/:id' => 'catalog#view'
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  root :to => 'site#home'
end
