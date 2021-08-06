class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false
      t.integer :level, null: false, default: 0
      t.string :school, null: false
      t.boolean :is_bard, null: false, default: false
      t.boolean :is_cleric, null: false, default: false
      t.boolean :is_druid, null: false, default: false
      t.boolean :is_paladin, null: false, default: false
      t.boolean :is_ranger, null: false, default: false
      t.boolean :is_sorcerer, null: false, default: false
      t.boolean :is_warlock, null: false, default: false
      t.boolean :is_wizard, null: false, default: false
      t.string :concentration, null: false, default: "No"
      t.text :description, limit: 4096, null: false
        
      t.index [:name], unique: true

      t.timestamps
    end
  end
end
