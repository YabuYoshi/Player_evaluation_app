class AddFirstTeamPointToGameInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :game_informations, :first_team_point, :integer
  end
end
