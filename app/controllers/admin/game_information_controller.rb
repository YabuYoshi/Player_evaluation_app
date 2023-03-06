class Admin::GameInformationController < ApplicationController
  def new
    @game_information = GameInformation.new
  end

  def create
    @game_information = GameInformation.new(game_information_params)
      if @game_information.save
        flash[:notice] = 'Game was successfully created.'
        redirect_to
      else
        render :new
      end
  end

  def index
    @game_informations = GameInformation.all
    @teams = Team.all
  end

  def edit
    @game_information = GameInformation.find(params[:id])
  end

  def update
    @game_information = GameInformation.find(params[:id])
      if @game_information.update(game_information_params)
        flash[:notice] = 'Game was successfully updated.'
        redirect_to
      else
        render :edit
      end
  end
  
  private

  def game_information_params
    params.require(:game_information).permit(:game_day, :first_second, :point)
  end

end
