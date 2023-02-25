class GameInformation < ApplicationRecord
  belongs_to :team
  has_many :reviews, dependent: :destroy
end
