Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    get "users", to: "users#index"
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "users#login"
    get "profiles/:id", to: "profiles#show", as: "profile_id"
    put "profiles/:id", to: "profiles#update", as: "profile_update"
  end
  
  scope '/api' do
    resources :vaccine_categories, only: [:create, :index, :update, :destroy, :show]
    resources :document_categories, only: [:create, :index, :update, :destroy, :show]
    resources :blood_oxygen_conditions, only: [:create, :update, :destroy, :index, :show]
    resources :blood_glucose_conditions, only: [:create, :update, :destroy, :index, :show]
    resources :blood_pressure_condition, only: [:index, :create, :update, :show, :destroy ]
    resources :lab_result_categories, only: [:index, :create, :update, :show, :destroy ]
    resources :lab_measurements, only: [:index, :create, :update, :show, :destroy ]

    resources :blood_oxygens, only: [:create, :destroy, :index, :show]
    resources :blood_glucoses, only: [:create, :destroy, :index, :show]
    resources :body_weight_height, only: [:index, :show, :create, :destroy]
    resources :blood_pressure, only: [:index, :show, :create, :destroy]
		resources :vaccines, only: [:create, :index, :destroy, :show]
		resources :documents, only: [:create, :index, :destroy, :show]
		resources :lab_results, only: [:create, :index, :destroy, :show]
		resources :join_lab_measurements, only: [:create, :index, :destroy, :show]
  end
  
end
