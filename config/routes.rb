Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :employees, controllers: {registrations: 'registrations'}
  resources :employee_edits
  resources :kudos

  get '/health_check', to: redirect('/health_check.html')
  get 'dashboard' => 'dashboard#index', as: 'dashboard'
  get 'admin_dashboard' => 'dashboard#admin_index', as: 'admin_dashboard'
  get 'leaderboard' => 'leaderboard#index', as: 'leaderboard'
end
