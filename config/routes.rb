PianoDB::Application.routes.draw do

  resources :performances, :compositions

  devise_for :users

  devise_scope :user do
    match '/login'          => 'devise/sessions#new',     :as => 'login'
    match '/users/sign_in'  => 'devise/sessions#new'
    match '/users/sign_out' => 'devise/sessions#destroy', :as => 'sign_out'
    match '/logout'         => 'devise/sessions#destroy', :as => 'logout'
  end

  namespace :admin do
    resources :compositions
    resources :people
    resources :performances
  end

  match 'top10' => 'site#top10'

  root :to => 'site#top10'

  match 'composers' => 'admin/people?composer=1'
  match 'performers' => 'admin/people?performer=1'
end
