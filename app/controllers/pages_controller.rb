class PagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @userplayers = UserPlayer.where(user_id: @user.id)
      @players = Player.all
    else
      redirect_to new_user_session_path
    end
  end

  def help
  end
end
