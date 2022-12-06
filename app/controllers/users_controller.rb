class UsersController < ApplicationController
 def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books
 end

 def edit
  if current_user == User.find(params[:id])
   @user = current_user
  else
   redirect_to user_path(current_user.id)
  end
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:success] = 'You have updated user successfully.'
   redirect_to user_path(current_user.id)
  else
   render:edit
  end
 end

 def destory
 end

 def index
  @users = User.all
  @user = current_user
  @books = @user.books
  @booknew = Book.new
 end

 private
def user_params
 params.require(:user).permit(:name, :introduction, :profile_image)
end
end
