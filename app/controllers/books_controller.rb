class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).all
    # @books = Book.joins(:publisher).where(publishers: { country: 'Brazil' })
    # @books = Book.page(params[:page]).per(10)  # 10 livros por página
    
  end

  def show
    # @books = Book.find([:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if(@book.save)
      redirect_to @book, notice: 'Your book was created sucessfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Your book was updated sucessfully'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Your book was deleted succesfully'
  end

  private 

  def book_params
    params.require(:book).permit(:title, :author, :publication_year, :genre)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
