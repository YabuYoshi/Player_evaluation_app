class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy_evaluation
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/admin/teams"
  end

  def destroy_comment
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/admin/teams"
  end

end
