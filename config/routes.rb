Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :blood_glucoses, only: [:create, :destroy, :index, :show]
    resources :blood_glucose_conditions, only: [:create, :update, :destroy, :index, :show]
	end
  # Defines the root path route ("/")
  # root "articles#index"
end
