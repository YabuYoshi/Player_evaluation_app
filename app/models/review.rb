class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game_information
  belongs_to :team
  belongs_to :player, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :evaluation, presence: true, on: :create
  validates :point,      presence: true, on: :update

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
