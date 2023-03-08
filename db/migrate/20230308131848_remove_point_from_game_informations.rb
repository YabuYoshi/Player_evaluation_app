class RemovePointFromGameInformations < ActiveRecord::Migration[6.1]
  def change
    remove_column :game_informations, :point, :integer
  end
end
