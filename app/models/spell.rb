class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    
    # Validations
    
    # Name
    validates_presence_of :name, message: ": cannot be blank."
    validates_uniqueness_of :name, case_sensitive: false, message: ": cannot be the same as an existing spell. Case insensitive."
    validates_length_of :name, maximum: 70
    validates :name, uniqueness: true
    
    # Level
    validates_presence_of :level
    validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9
    
    # School
    # Used inclusion, learned from: https://guides.rubyonrails.org/active_record_validations.html#inclusion
    validates_presence_of :school, message: ": cannot be blank."
    school_inclusion_message = ": must be one of the schools listed."
    
    validates :school, inclusion: { in: %w(Conjuration Necromancy Evocation Abjuration
                                            Transmutation Divination Enchantment Illusion), 
                                    message: school_inclusion_message}
    
    # Spell classes
    # Used with_options, learned from: https://api.rubyonrails.org/v6.1.4/classes/Object.html#method-i-with_options
    with_options inclusion: { in: [true, false] } do |spell_class|
    
        spell_class.validates :is_bard
        spell_class.validates :is_cleric
        spell_class.validates :is_druid
        spell_class.validates :is_paladin
        spell_class.validates :is_ranger
        spell_class.validates :is_sorcerer
        spell_class.validates :is_warlock
        spell_class.validates :is_wizard
    end
    
    validate :is_one_or_more_class
    
    def is_one_or_more_class
        if (is_bard.present? == false  && is_cleric.present? == false && is_druid.present? == false && is_paladin.present? == false && 
        is_ranger.present? == false && is_sorcerer.present? == false && is_warlock.present? == false && is_wizard.present? == false)
            errors.add(:spell, ": must have one or more classes.")
        end         
    end
    
    # Concentration
    validates_presence_of :concentration
    validates :concentration, inclusion: { in: %w(Yes No) }
    
    # Description
    validates :description, exclusion: {in: [nil, ""], message: ": cannot be blank."}
    validates_length_of :description, maximum: 4096
    
    #Order spells
    def self.order_by
        return Spell.order(level: :asc, name: :asc)
    end
    
    # Code given in Betterbooks homework instructions, created by instructor/TA
    def self.array_for_select_schools
        array = ["Abjuration", "Conjuration", "Divination", "Enchantment", 
            "Evocation", "Illusion", "Necromancy", "Transmutation"]
        return array
    end
    
    def self.array_for_select_level
        array = [0,1,2,3,4,5,6,7,8,9]
    end
    
    def spell_classes
        spell_classes = Array.new
        if is_bard == true
            spell_classes.push("Bard")
        end
        if is_cleric == true
            spell_classes.push("Cleric")
        end
        if is_druid == true
            spell_classes.push("Druid")
        end
        if is_paladin == true
            spell_classes.push("Paladin")
        end
        if is_ranger == true
            spell_classes.push("Ranger")
        end
        if is_sorcerer == true
            spell_classes.push("Sorcerer")
        end
        if is_warlock == true
            spell_classes.push("Warlock")
        end
        if is_wizard == true
            spell_classes.push("Wizard")
        end
        
        #join elements in an array to produce a string, learned from: https://apidock.com/ruby/Array/join
        string = spell_classes.join(", ")
        return string
    end
    
end