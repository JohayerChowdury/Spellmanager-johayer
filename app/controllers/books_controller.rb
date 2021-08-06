class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /books
  def index
    # We've added a method, self.order_by, to the Book model, 
    # see models/book.rb
    @books = Book.order_by params[:order_by]
  end

  # GET /books/:id
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/:id/edit
  def edit
      @book = Book.find(params[:id])
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Successfully added #{@book.name} to All Books."
      redirect_to @book
    else
      render :new
    end
  end

  # PATCH/PUT /books/:id
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to @book
    else
      render :edit
    end
  end

  # DELETE /books/:id
  def destroy
    @book = Book.find(params[:id])  
    if @book.destroy
        flash[:notice] = "Successfully deleted #{@book.name}."
    else
        flash[:notice] = 'Unable to destroy book.'
    end
    redirect_to books_url 
  end
    
  def add_spell_to_book
      @book = Book.find(params[:id])
      @spells = Spell.order_by
  end
    
  def add_spell
      @book = Book.find(params[:id])
      @spell = Spell.find(params[:spell_id])
      if @book.spells << @spell
          if @book.save
             flash[:notice] = "Successfully added #{@spell.name} to #{@book.name}"
          end
      else
          flash[:notice] = "Unable to add spell to book."
      end
      redirect_to @book
  end
    
  def remove_spell
      @book = Book.find(params[:id])
      @spell = Spell.find(params[:spell_id])
      if @book.spells.delete(@spell)
          flash[:notice] = "Successfully removed #{@spell.name} from #{@book.name}."
      else
          flash[:notice] = "Unable to remove spell."
      end
      redirect_to @book
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :name
      params.require(:book).permit(:name)
#       bp = params.require(:book).permit(:name, :spell_ids => [])
#       bp[:spell_ids] = bp[:spell_ids].reject { |s| s.empty? }
#       return bp
    end
end
