Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  namespace :sessions do
    get 'login' => :new
    post 'signin' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :students
end
