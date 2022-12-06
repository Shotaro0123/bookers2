class BooksController < ApplicationController

 def new
  @book = Book.new
 end

 def create
  @user = current_user
  @books = Book.all
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:success] = 'You have created book successfully.'
   redirect_to book_path(@book.id)
  else
   render:index
  end
 end

 def show
  @book = Book.find(params[:id])
  @user = @book.user
  @booknew = Book.new
 end

 def edit
  if current_user == Book.find(params[:id]).user
   @book = Book.find(params[:id])
  else
   redirect_to books_path
  end
 end

 def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
   flash[:success] = 'You have updated book successfully.'
   redirect_to book_path(@book.id)
  else
   render:edit
  end
 end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to  books_path
 end

 def index
  @user = current_user
  @book = Book.new
  @books = Book.all
 end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def update_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
