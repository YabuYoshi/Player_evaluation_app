class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/admin/users"
  end

  def destroy_evaluation
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_review_path(review)
  end

  def destroy_comment
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_review_path(review)
  end

end
