class SpellsController < ApplicationController
    
  # GET /spells
  def index
      @spells = Spell.order_by #params[:order_by]
  end

  # GET /spells/:id
  def show
      @spell = Spell.find(params[:id])
  end
    
  # GET /spells/new
  def new
      @spell = Spell.new
  end
    
  # POST /spells
  def create
      @spell = Spell.new(spell_params)
      
      if @spell.save
          flash[:notice] = 'Spell was successfully created.'
          redirect to @spell
      else
          render :new
      end
  end
    
  # GET /spells/:id/edit
  def edit
      @spell = Spell.find(params[:id])
  end

  # PATCH /spells/:id
  def update
      @spell = Spell.find(params[:id])
      if @spell.update(spell_params)
          flash[:notice] = 'Spell was successfully updated.'
          redirect to @spell
      else
          render :edit
      end
  end

  # DELETE /spells/:id
  def destroy
      @spell = Spell.find(params[:id])
      if @spell.destroy
          flash[:notice] = 'Spell was successfully deleted.'
      else
          flash[:notice] = 'Unable to delete spell.'
      end
      redirect_to spells_url
  end
    
  def add_spell_to_book
      @spell = Spell.find(params[:id])
  end
  
#   def add_book
#       @spell = Spell.find(params[:id])
#       if @spell.books
#       end
#   end
  
  private
    # Only allow a trusted parameter "white list" through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :spell.
      # The value for the :spell key is another hash.
      # If params does not contain the key :spell, an exception is raised.  
      # Only the "spell" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of the following:
      params.require(:spell).permit(:name, :level, :is_bard, :is_cleric, :is_druid, :is_paladin, :is_ranger, 
                                    :is_sorcerer, :is_warlock, :is_wizard, :concentration, :description)
    end
end
