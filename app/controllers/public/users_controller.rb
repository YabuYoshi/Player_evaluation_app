class Public::UsersController < ApplicationController
 def show
   @user = current_user
 end

 def edit
   @user = current_user
 end

 def update
   @user = current_user
     if @user.update(user_params)
       flash[:notice] = 'User was successfully updated.'
       redirect_to users_path
     else
       render :edit
     end
 end

 def user_params
   params.require(:user).permit(:name, :email)
 end
end
