class Admin::PlayersController < ApplicationController
  def create
    @player = Player.new(player_params)
      if @player.save
        flash[:notice] = 'ModelClassName was successfully created.'
        redirect_to admin_team_path(@player.team_id)
      else
        render admin_team_path(@player.team_id)
      end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    #byebug
      if @player.update(player_params)
        flash[:notice] = 'Player was successfully updated.'
        redirect_to admin_team_path(@player.team_id)
      else
        render :edit
      end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to admin_team_path(@player.team_id)
  end

  private

  def player_params
    params.require(:player).permit(:team_id, :name)
  end

end
