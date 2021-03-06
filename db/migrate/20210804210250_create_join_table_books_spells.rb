class CreateJoinTableBooksSpells < ActiveRecord::Migration[6.1]
  def change
    create_join_table :books, :spells do |t|
      # t.index [:book_id, :spell_id]
      t.index [:spell_id, :book_id], unique: true
    end
  end
end
