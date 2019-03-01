Rails.application.routes.draw do
  get 'users/task'
  get 'users/home' => 'users#home'
  get 'users' => 'users#index'
  get '/users/task' => 'users#task'

  get '/users/admin' => 'users#admin'

  get 'users/login' => 'users#login'
  delete 'users/login' => 'users#logout'
  post 'users/login' => 'users#check'
  post 'users/registration' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
