class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer  :player_id,           null: false
      t.integer  :user_id,             null: false
      t.integer  :game_information_id, null: false
      t.datetime :datetime,            null: false
      t.decimal  :point,               null: false
      t.text     :evaluation,          null :false
      t.timestamps
    end
  end
end
