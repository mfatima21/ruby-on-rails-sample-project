Rails.application.routes.draw do
  resources :api_logs
  resources :users
  resources :jobs
  get "jobs/execute_job/:id", :controller => 'jobs', :action => :execute_job
  post 'authenticate', to: 'authentication#authenticate'

  # get 'jobs/execute_job/:id' => 'jobs#execute_job', as: :execute_job

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get 'jobs/execute_job', to: 'jobs#execute_job'
end
