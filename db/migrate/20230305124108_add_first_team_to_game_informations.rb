class AddFirstTeamToGameInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :game_informations, :first_team, :integer
  end
end
