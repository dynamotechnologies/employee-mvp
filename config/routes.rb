Rails.application.routes.draw do

  get 'feedback/enter'

  post 'feedback/create'

  get 'feedback/thanks'

  get 'feedback/show'

  devise_for :users
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
