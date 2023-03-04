class Admin::HomesController < ApplicationController
  def top
    @reviews = Review.page(params[:page])
  end
end
