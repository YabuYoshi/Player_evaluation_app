class ChangeColumnNullGameInformation < ActiveRecord::Migration[6.1]
  def change
    change_column_null :game_informations, :first_team_id, false
    change_column_null :game_informations, :second_team_id, false
  end
end
