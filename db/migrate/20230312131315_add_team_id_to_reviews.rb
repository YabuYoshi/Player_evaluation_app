class AddTeamIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :team_id, :integer
  end
end
