RunningBalance::Application.routes.draw do
  resources :accounts

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # The priority is based upon order of creation:
  # first created -> highest priority.


  root :to => 'dashboard#index', :as => "dashboard"
  match "/dashboard/index", :as => "root"

  resources :accounts

  resources :settings do
    collection do
      post 'switch_browsing_type'
    end
  end

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
