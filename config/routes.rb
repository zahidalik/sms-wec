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

  # get 'schools/user_schools/:user_id/:school_id', to: "user_schools#new", as: :user_school_new

  resources :users do
    resources :standards, only: [:index, :show] do
      resources :user_standard_academic_year, only: [:new, :create]
    end
    resources :schools, only: [:index, :show] do
      resources :user_schools, only: [:new, :create]
    end
  end

  resources :students do
    resources :standards, only: [:index, :show]
    resources :schools, only: [:index, :show] do
      resources :student_schools, only: [:new, :create]
      resources :student_standard_academic_year, only: [:new, :create]
    end
  end

  resources :schools, shallow: true do
    resources :standards
    resources :users
    resources :students
  end
end
