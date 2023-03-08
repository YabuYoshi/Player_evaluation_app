class ChangeColumnNullGameInformation3 < ActiveRecord::Migration[6.1]
  def change
    change_column_null :game_informations, :second_team_point, false
  end
end
