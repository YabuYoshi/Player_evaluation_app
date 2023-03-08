class ChangeColumnNullGameInformation2 < ActiveRecord::Migration[6.1]
  def change
    change_column_null :game_informations, :first_team_point, false
    change_column_null :game_informations, :first_team_point, false
  end
end
