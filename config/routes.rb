RunningBalance::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # The priority is based upon order of creation:
  # first created -> highest priority.


  root :to => 'dashboard#index', :as => "dashboard"
  match "/dashboard/index", :as => "root"
  match "index" => "dashboard#index"

  resources :accounts do
    resources :transactions
  end

  resources :settings do
    collection do
      post 'switch_browsing_type'
      get 'switch_browsing_type'
      get "my"
      get "filter_transactions_to_previous_month"
    end
  end

  get "pages/about"
  get "pages/about_technical"
  get "pages/api"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
