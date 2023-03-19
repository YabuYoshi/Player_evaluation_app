class Admin::HomesController < ApplicationController
  def top
    @reviews = Review.page(params[:page])
    @user = current_user
  end
end
