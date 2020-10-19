class PlayersController < ApplicationController
    def index
        @players = Player.all
        if user_signed_in?
            @user = current_user
            @user_players = UserPlayer.where(user_id: @user.id)
        end
    end

    def user_players
        if user_signed_in?
            @user = current_user
            @user_players = UserPlayer.where(user_id: @user.id)
        end
    end
  end