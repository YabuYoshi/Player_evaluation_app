class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game_information
  belongs_to :team
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
