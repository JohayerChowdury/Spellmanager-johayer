class Book < ApplicationRecord
    has_and_belongs_to_many :spells
    
    # Validations
    
    # Name
    validates_presence_of :name
    validates_length_of :name, maximum: 70
    validates_uniqueness_of :name, case_sensitive: false, message: "Cannot be the same as an existing book. Case insensitive."
    validates :name, uniqueness: true
    
end
