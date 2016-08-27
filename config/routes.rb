Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :employees, controllers: {registrations: 'registrations'}
  resources :employee_edits

  get '/health_check', to: redirect('/health_check.html')
  get 'dashboard' => 'dashboard#index', as: 'dashboard'
  get 'leaderboard' => 'leaderboard#index', as: 'leaderboard'

  post 'kudos' => 'kudos#give', as: 'kudos'
end
