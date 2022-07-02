Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api' do
    resources :lab_result_categories, only: [:create, :index, :update, :destroy, :show]
    resources :lab_results, only: [:create, :index, :destroy, :show]
  end
end
