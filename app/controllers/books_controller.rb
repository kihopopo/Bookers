class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
   book = Book.new(book_params)
   book.save
   redirect_to book_path(book.id)  
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end

  def destroy
    book = Book.find(params[:id])  #
    book.destroy  
    redirect_to '/books'  
  end
  
private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end