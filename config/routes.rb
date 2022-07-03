Rails.application.routes.draw do
  scope '/api' do
		resources :blood_oxygen_conditions, only: [:create, :update, :destroy, :index, :show]
    resources :blood_oxygens, only: [:create, :destroy, :index, :show]
	end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "users#login"
    get "profiles/:id", to: "profiles#show", as: "profile_id"
    put "profiles/:id", to: "profiles#update", as: "profile_update"
  end
  
  scope '/api' do
    resources :body_weight_height, only: [:index, :show, :create, :destroy]
    resources :blood_pressure, only: [:index, :show, :create, :destroy]
    resources :blood_pressure_condition, only: [:index, :create, :update, :show, :destroy ]
  end

end
