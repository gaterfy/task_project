Rails.application.routes.draw do

  resources :users, except: [:destroy] do
    get :home
    collection do
      get :login, action: :login
      get :home,  action: :home
      get :admin, action: :admin
      get :task, action: :task
      get :edit, action: :edit

      post :login, action: :check
      post :update, action: :update
      post :registration, action: :create
      delete :login, action: :logout
    end
  end

match "*path", to: redirect("/"), via: :get
end
  #get 'users/task'
  #get 'users/home' => 'users#home'
  #get 'users' => 'users#index'
  #get '/users/task' => 'users#task'

  #get '/users/admin' => 'users#admin'

  #get 'users/login' => 'users#login'
  #delete 'users/login' => 'users#logout'
  #post 'users/login' => 'users#check'
  #post 'users/registration' => 'users#create'
  #post 'users/update' => 'users#update'

  #post'/users/create-project' => 'users#project'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
