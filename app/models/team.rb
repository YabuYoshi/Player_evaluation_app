class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :game_informations
  has_many :reviews, dependent: :destroy
end
