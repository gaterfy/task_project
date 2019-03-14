Rails.application.routes.draw do

  resources :users, except: [:destroy] do
    get :home
    collection do
      get :login, action: :login
      get :home,  action: :home
      get :admin, action: :admin #ressource
      #get :task, action: :task => il lui faut un controller , au moins d'une page
      #get :edit, action: :edit

      post :login, action: :check #controllers sessions #sessions
      post :update, action: :update
      post :registration, action: :new
      post :uploaders, action: :set_user_profile_picture
      delete :login, action: :logout
    end

  end

  resources :uploaders, only: [:post] do
      post :set_picture, action: :set_user_profile_picture
  end
  resource :set_picture, only: [:post] do
    post :set_picture, action: :set_user_profile_picture
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
