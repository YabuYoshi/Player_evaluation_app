class GameInformation < ApplicationRecord
  belongs_to :first_team,  class_name: "Team"
  belongs_to :second_team, class_name: "Team"
  has_many :reviews, dependent: :destroy
end
