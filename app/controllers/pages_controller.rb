class PagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session
    end
  end

  def help
  end
end
