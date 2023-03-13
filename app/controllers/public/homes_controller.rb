class Public::HomesController < ApplicationController
  def top
    @game_informations = GameInformation.all
  end
end
