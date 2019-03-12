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
    if @current_user.update(user_params)
      redirect_to 'users/home'
    else
      render 'update'
    end
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

  def create
    if @current_user.role == "admin"
      User.create(user_params)
      flash[:info] = "Vous avez créer un compte , connectez-vous à présent"
      redirect_to "/users/login"
    else
      flash[:info] = "vous n'êtes pas autorisé à faire ça"
    end
  end

  def check
    p "email" + params[:email] + "password" + params[:password]
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

  # def update
  #   user = User.find(@current_user.id)
  #   succes= user.update(user_params)
  #
  #   if success
  #     redirect_to "/users/home"
  #   end
  #
  # end

  private
  def user_params
    params.require(:user).permit(:email, :name, :lastname, :password, :color)
  end

end
