class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.integer :team_id, null: false
      t.string  :name,    null: false
      t.timestamps
    end
  end
end
