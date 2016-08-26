Rails.application.routes.draw do

  devise_for :employees, controllers: {registrations: 'registrations'}
  get 'feedback/enter'

  post 'feedback/create'

  get 'feedback/thanks'

  get 'feedback/show'

  get 'dashboard' => 'dashboard#index', as: 'dashboard'

  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
