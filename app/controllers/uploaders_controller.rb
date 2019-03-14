class UploadersController < ApplicationController

  def set_user_profile_picture
    user = @current_user
    user.avatar = params[:file] # Assign a file like this, or
    File.open('somewhere') do |f|
      user.avatar = f
    end
    user.save!
    @current_user = u
  end

  private
  def avatar_params
    params.require(:snippet).permit(:avatar)
  end
end
