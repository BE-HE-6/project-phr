Rails.application.routes.draw do
  get 'blood_oxygens/create'
  get 'blood_oxygens/destroy'
  get 'blood_oxygens/show'
  get 'blood_oxygens/index'

  scope '/api' do
		resources :blood_oxygen_conditions, only: [:create, :update, :destroy, :index]
    resources :blood_oxygens, only: [:create, :destroy, :index, :show]
	end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
