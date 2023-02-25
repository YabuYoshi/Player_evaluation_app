class CreateGameInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :game_informations do |t|
      t.integer :team_id,       null: false
　　　t.date    :game_day,      null: false
　　　t.boolean :first_seccond, null: false
　　　t.integer :point,         null: false
      t.timestamps
    end
  end
end
