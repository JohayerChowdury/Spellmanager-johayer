class BooksController < ApplicationController
    
  # GET /books
  def index
      @books = Book.all
  end

  # GET /books/:id
  def show
      @book = Book.find(params[:id])
  end
    
  # GET /books/new
  def new
      @book = Book.new
  end
    
  # POST /books
  def create
      @book = Book.new(book_params)
      
      if @book.save
          flash[:notice] = 'Book was successfully created.'
          redirect to @book
      else
          render :new
      end
  end
    
  # GET /books/:id/edit
  def edit
      @book = Book.find(params[:id])
  end

  # PATCH /books/:id
  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
          flash[:notice] = 'Book was successfully updated.'
          redirect to @book
      else
          render :edit
      end
  end

  # DELETE /books/:id
  def destroy
      @book = Book.find(params[:id])
      if @book.destroy
          flash[:notice] = 'Book was successfully deleted.'
      else
          flash[:notice] = 'Unable to delete book.'
      end
      redirect_to books_url
  end
    
  def add_spell_to_book
      @book = Book.find(params[:id])
  end
    
#   def add_spell
#       @book = Book.find(params[:id])
#   end
    
#   def remove_spell
#       @book = Book.find(params[:id])
#   end
  
  private
    # Only allow a trusted parameter "white list" through.
    def book_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of the following:
      params.require(:book).permit(:name)
    end
end
