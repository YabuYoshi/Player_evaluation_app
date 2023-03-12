class Public::HomesController < ApplicationController
  def top
    @game_informations = GameInformation.all
    @team = Team.ids
  end
end
