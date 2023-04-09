class Public::UsersController < ApplicationController
 def show
    if user_signed_in?
      review = current_user.reviews.find_by(player_id: nil)
      if review
        redirect_to edit_review_path(review)
      end
    end
   @user = current_user
   @reviews = @user.reviews
 end

 def edit
   @user = current_user
 end

 def update
   @user = current_user
     if @user.update(user_params)
       flash[:notice] = 'User was successfully updated.'
       redirect_to user_path
     else
       render :edit
     end
 end

 def user_params
   params.require(:user).permit(:name, :email)
 end
end
