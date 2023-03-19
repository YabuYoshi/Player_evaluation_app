class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(new_review_params)
    @review.user_id = current_user.id
      if @review.save!
        flash[:notice] = 'Review was successfully created.'
        redirect_to edit_review_path(@review.id)
      else
        render :new
      end
  end

  def reviews_all_team
    @reviews = Review.page(params[:page])
  end

  def reviews_team
    @reviews = Review.page(params[:page])
  end

  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
      if @review.update(review_params)
        flash[:notice] = 'Review was successfully updated.'
        redirect_to review_path(@review.id)
      else
        render :edit
      end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :show
  end

  def search
    if params[:team_name].present?
      @reviews = Review.where('team_name LIKE ?', "%#{params[:team_name]}%")
    else
      @reviews = Review.none
    end
  end

  private

  def review_params
    params.require(:review).permit(:team_id, :player_id, :user_id, :game_information_id, :detetime, :point, :evaluation)
  end

  def new_review_params
    params.require(:review).permit(:team_id, :user_id, :game_information_id, :evaluation)
  end

end
