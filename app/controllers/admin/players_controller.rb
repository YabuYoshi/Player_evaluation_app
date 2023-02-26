class Admin::PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def create
    @player = Player.new(player_params)
      if @player.save
        flash[:notice] = 'ModelClassName was successfully created.'
        redirect_to admin_players_path
      else
        render :index
      end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
      if @player.update(player_params)
        flash[:notice] = 'Player was successfully updated.'
        redirect_to "/admin/players"
      else
        render :edit
      end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to "/admin/players"
  end

  private

  def player_params
    params.require(:player).permit(:team_id, :name)
  end

end
