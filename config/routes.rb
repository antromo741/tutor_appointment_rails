Rails.application.routes.draw do
  devise_for :tutors
  resources :appointments
  resources :tutors do
    resources :appointments, only: [:index, :new]
  end
  resources :students do
    resources :tutors, only: [:index]
    resources :appointments, only: [:index, :new]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'students#index', constraints: lambda { |request| request.env['warden'].user.class.name == 'User'}, as: "user_root"
  root to: 'tutor/appointments#index', constraints: lambda { |request| request.env['warden'].user.class.name == 'Tutor' }, as: "tutor_root"
  
  namespace :tutor do
    resources :appointments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
