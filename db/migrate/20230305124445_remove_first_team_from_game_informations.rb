class RemoveFirstTeamFromGameInformations < ActiveRecord::Migration[6.1]
  def change
    remove_column :game_informations, :first_team, :integer
  end
end
