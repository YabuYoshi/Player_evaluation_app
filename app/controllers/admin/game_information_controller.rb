class Admin::GameInformationController < ApplicationController
  def new
    @game_information = GameInformation.new
  end

  def create
    @game_information = GameInformation.new(game_information_params)
      if @game_information.save
        flash[:notice] = 'Game was successfully created.'
        redirect_to admin_game_information_index_path
      else
        render :new
      end
  end

  def index
    @game_informations = GameInformation.all
    #byebug
    #@first_team = @game_informations.first_team
    #@second_team = @game_informations.second_team
  end

  def edit
    @game_information = GameInformation.find(params[:id])
  end

  def update
    @game_information = GameInformation.find(params[:id])
      if @game_information.update(game_information_params)
        flash[:notice] = 'Game was successfully updated.'
        redirect_to admin_game_information_index_path
      else
        render :edit
      end
  end

  private

  def game_information_params
    params.require(:game_information).permit(:first_team_id, :second_team_id, :game_day, :first_team_point, :second_team_point)
  end

end
