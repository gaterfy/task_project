# app/controllers/users_controller.rb
class UsersController < ApplicationController

  def home
  end

  def login
  end

  def logout
    session[:user_id] = nil
    flash[:info] = "Vous êtes maintenant déconnecté."
    redirect_to "/users/home"
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

  def create
    if @current_user.role == "admin"
      User.create(name: params[:session][:email], password: params[:session][:password])
      flash[:info] = "Vous avez créer un compte , connectez-vous à présent"
      redirect_to "/users/login"
    else
      flash[:info] = "vous n'êtes pas autorisé à faire ça"
  end end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
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
end
