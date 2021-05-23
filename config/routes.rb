Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  namespace :sessions do
    get 'login' => :new
    post 'signin' => :create
    delete 'logout' => :destroy
  end

  # resources :users
  # resources :students
  # resources :schools

  resources :users do
    resources :user_schools, only: [:new, :create]
    resources :schools, only: [:index] do
      resources :user_standard_academic_year, only: [:new, :create]
    end
  end

  resources :students do
    resources :student_schools, only: [:new, :create]
    resources :schools, only: [:index] do
      resources :student_standard_academic_year, only: [:new,:create]
    end
  end

  resources :schools, shallow: true do
    resources :standards
  end
end
