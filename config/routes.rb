CCMTV::Application.routes.draw do

  resources :performances, :compositions, :people

  devise_for :users

  devise_scope :user do
    match '/login'          => 'devise/sessions#new',     :as => 'login'
    match '/users/sign_in'  => 'devise/sessions#new'
    match '/users/sign_out' => 'devise/sessions#destroy', :as => 'sign_out'
    match '/logout'         => 'devise/sessions#destroy', :as => 'logout'
  end

  namespace :admin do
    resources :compositions, :people, :performances
    match 'new_composition_ajax' => 'compositions#new_comp_ajax'
  end

  match 'top10' => 'site#top10'

  root :to => 'site#top10'

  match 'composers' => 'people#composers'
  match 'performers' => 'people#performers'

end
