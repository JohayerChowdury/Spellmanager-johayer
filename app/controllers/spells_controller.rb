class SpellsController < ApplicationController
  before_action :set_spell, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /spells
  def index
    @spells = Spell.order_by
  end

  # GET /spells/:id
  def show
      @spell = Spell.find(params[:id])
  end

  # GET /spells/new
  def new
    @spell = Spell.new
  end

  # GET /spells/:id/edit
  def edit
      @spell = Spell.find(params[:id])
  end

  # POST /spells
  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      flash[:notice] = "Successfully added #{@spell.name} to All Spells."
      redirect_to @spell
    else
      render :new
    end
  end

  # PATCH/PUT /spells/:id
  def update
    if @spell.update(spell_params)
      flash[:notice] = "Successfully edited #{@spell.name}"
      redirect_to @spell
    else
      render :edit
    end
  end

  # DELETE /spells/:id
  def destroy
    if @spell.destroy
        flash[:notice] = "Successfully deleted #{@spell.name}"
    else
        flash[:notice] = 'Unable to delete spell.'
    end
    redirect_to spells_url
  end
  
  def add_spell_to_book
      @spell = Spell.find(params[:id])
  end
    
  def add_book
      @spell = Spell.find(params[:id])
      @book = Book.find(params[:book])
      if @spell.books.exists?(@book.id)
          flash[:notice] = "#{@spell.name} already exists in #{@book.name}."
      elsif @spell.books << @book
          if @spell.save
              flash[:notice] = "Successfully added #{@spell.name} to #{@book.name}."
          end
      else   
          flash[:notice] = "Unable to add spell to book."
      end 
      redirect_to spells_url
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_spell
      @spell = Spell.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :spell.
      # The value for the :spell key is another hash.
      # If params does not contain the key :spell, an exception is raised.  
      # Only the "spell" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of the following:
      params.require(:spell).permit(:name, :level, :school, :is_bard, :is_cleric, :is_druid, 
          :is_paladin, :is_ranger, :is_sorcerer, :is_warlock, :is_wizard, :concentration, :description)
#       sp = params.require(:spell).permit(:name, :level, :school, :is_bard, :is_cleric, :is_druid, 
#           :is_paladin, :is_ranger, :is_sorcerer, :is_warlock, :is_wizard, :concentration, :description, :book_ids => [])
#       sp[:book_ids] = sp[:book_ids].reject { |b| b.empty? }
#       return sp
    end
end
