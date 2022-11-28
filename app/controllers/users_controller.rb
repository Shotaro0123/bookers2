class UsersController < ApplicationController
 def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books
 end

 def edit
  @user = User.find(params[:id])
  @user = current_user
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:success] = 'You have updated user successfully.'
   redirect_to books_path
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
 end

 private
def user_params
 params.require(:user).permit(:name, :introduction, :profile_image)
end
end
