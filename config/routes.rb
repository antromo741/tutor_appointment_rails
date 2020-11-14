Rails.application.routes.draw do
  resources :appointments
  resources :tutors do
    resources :appointments, only: [:index, :new]
  end
  resources :students do
    resources :tutors, only: [:index]
    resources :appointments, only: [:index, :new]
  end
  devise_for :users
  root 'students#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
