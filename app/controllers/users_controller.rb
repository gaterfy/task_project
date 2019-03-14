# app/controllers/users_controller.rb
class UsersController < ApplicationController

  #validates :email, presence: true, email: true
  #p errors.full_messages
  def home
    @users = User.all
  end

  def login
  end

  def update
    @current_user = User.find(params[:id])
    redirect_to 'users/home' if @current_user.update(user_params)
  end


  def logout
    session[:user_id] = nil
    flash[:notice]= "Vous êtes maintenant déconnecté."
    redirect_to "/users/login"
  end

  def project
    if @current_user.role == "admin"
      Project.create(name: params[:name], duration: params[:duration], user_id: @current_user.id)
      flash[:info] = "Vous avez créer un projet"
      redirect_to "/users/home"
    else
      flash[:info] = "vous n'êtes pas autorisé à faire ça"
    end
  end

  def new
    if @current_user.role == "admin"
      User.create(user_params)
      flash[:info] = "Vous avez créer un compte , connectez-vous à présent"
      redirect_to "/users/login"
    else
      flash[:info] = "vous n'êtes pas autorisé à faire ça"
    end
  end

  def check
    @current_user = User.find_by(email: params[:email]).authenticate(params[:password])

    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def index
    @users = User.all
    @project = Project.all
  end

  def set_user_profile_picture
    #//require 'open-uri'
    #user = @current_user
    #user.avatar = params[:file] # Assign a file like this, or
    #my_file = params[:file]

  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :lastname, :password, :color, :avatar)
  end

end
