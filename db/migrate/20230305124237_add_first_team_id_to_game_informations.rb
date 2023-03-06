class AddFirstTeamIdToGameInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :game_informations, :first_team_id, :integer
  end
end
