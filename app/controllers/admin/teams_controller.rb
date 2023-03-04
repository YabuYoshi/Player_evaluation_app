class Admin::TeamsController < ApplicationController
  def index
    @team = Team.new
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @player = Player.new
    @players = @team.players
  end

  def create
    @team = Team.new(team_params)
      if @team.save
        flash[:notice] = 'Team was successfully created.'
        redirect_to admin_teams_path
      else
        render :index
      end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
      if @team.update(team_params)
        flash[:notice] = 'Team was successfully updated.'
        redirect_to "/admin/teams"
      else
        render :edit
      end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to "/admin/teams"
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
