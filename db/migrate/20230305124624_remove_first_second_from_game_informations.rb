class RemoveFirstSecondFromGameInformations < ActiveRecord::Migration[6.1]
  def change
    remove_column :game_informations, :first_second, :boolean
  end
end
