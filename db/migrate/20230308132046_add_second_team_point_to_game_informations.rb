class AddSecondTeamPointToGameInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :game_informations, :second_team_point, :integer
  end
end
