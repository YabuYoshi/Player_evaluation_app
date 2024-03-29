class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      review = current_user.reviews.find_by(player_id: nil)
      if review
        redirect_to edit_review_path(review)
      end
    end
    game_information_all = GameInformation.all
    @game_informations = {}
    # [Sun, 05 Mar 2023, Sun, 26 Mar 2023]
    GameInformation.pluck(:game_day).uniq.each do |day|
      game_information_all.each do |game_info|
        if game_info.game_day == day
          @game_informations[day] = [] if @game_informations[day].nil?
          @game_informations[day] << game_info
        end
      end
    end
  end
end
