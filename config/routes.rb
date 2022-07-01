Rails.application.routes.draw do
  scope '/api' do
    resources :blood_pressure, only: [:index, :show, :create, :destroy]
    resources :blood_pressure_condition, only: [:index, :create, :update, :show, :destroy ]
  end 
end
