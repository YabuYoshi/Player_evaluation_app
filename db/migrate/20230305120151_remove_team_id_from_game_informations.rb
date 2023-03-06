class RemoveTeamIdFromGameInformations < ActiveRecord::Migration[6.1]
  def change
    remove_column :game_informations, :team_id, :integer
  end
end
