Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api' do
		resources :document_categories, only: [:create, :index, :update, :destroy, :show]
	end
end
