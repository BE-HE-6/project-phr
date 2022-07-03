Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "users#login"
    get "profiles/:id", to: "profiles#show", as: "profile_id"
    put "profiles/:id", to: "profiles#update", as: "profile_update"
  end
  
  scope '/api' do
    resources :blood_oxygen_conditions, only: [:create, :update, :destroy, :index, :show]
    resources :blood_oxygens, only: [:create, :destroy, :index, :show]
    resources :blood_glucoses, only: [:create, :destroy, :index, :show]
    resources :blood_glucose_conditions, only: [:create, :update, :destroy, :index, :show]
    resources :body_weight_height, only: [:index, :show, :create, :destroy]
    resources :blood_pressure, only: [:index, :show, :create, :destroy]
    resources :blood_pressure_condition, only: [:index, :create, :update, :show, :destroy ]
    resources :vaccine_categories, only: [:create, :index, :update, :destroy, :show]
		resources :vaccines, only: [:create, :index, :destroy, :show]
    resources :document_categories, only: [:create, :index, :update, :destroy, :show]
		resources :documents, only: [:create, :index, :destroy, :show]
  end
  
end
