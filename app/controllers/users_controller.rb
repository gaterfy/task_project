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
