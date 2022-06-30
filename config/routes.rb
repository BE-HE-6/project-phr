Rails.application.routes.draw do
  scope '/api' do
		resources :blood_oxygen_conditions, only: [:create, :update, :destroy, :index, :show]
    resources :blood_oxygens, only: [:create, :destroy, :index, :show]
	end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
