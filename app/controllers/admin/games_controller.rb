class Admin::GamesController < ApplicationController
  
  
  private

  def game_information_params
    params.require(:game_information).permit(:game_day, :first_second, :point)
  end
end
