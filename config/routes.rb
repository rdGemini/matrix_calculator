Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'matrix_calculator/index'
  post 'matrix_calculator/multiply'
  root 'matrix_calculator#index'
  get 'matrix_calculator/show', to: 'matrix_calculator#show'

  # Defines the root path route ("/")
  # root "posts#index"
end
