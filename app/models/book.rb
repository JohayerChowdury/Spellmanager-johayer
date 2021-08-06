class Book < ApplicationRecord
    has_and_belongs_to_many :spells
    
    # Validations
    
    # Name
    validates_presence_of :name
    validates_length_of :name, maximum: 70
    validates_uniqueness_of :name, case_sensitive: false, message: "Cannot be the same as an existing book. Case insensitive."
    
    def self.to_nested_array_for_select
        nested = []
        Book.order(:name).each do |book|
            nested.push [book.name, book.id]
        end
        return nested
    end
    
#     def self.order_by field
#         if field == 'name'
#             return Book.order(:name)
#         elsif field == 'count'
#             return Book.left_outer_joins(:spells).group("books.id").order("count(spells.id)")
#         else
#             return Book.order(:name)
#         end
#     end
    
        #option 1(on Campuswire)
    @@reverse_order_name = false
    @@reverse_order_count = "ASC"
    
    def self.order_by field
        if field == 'name'
            if @@reverse_order_name == false
                @@reverse_order_name = true
                return Book.order(:name)
            else
                @@reverse_order_name = false
                return Book.order(:name).reverse_order
            end
        elsif field == 'count'
            if @@reverse_order_count == "ASC"
                @@reverse_order_count = "DESC"
                return Book.left_outer_joins(:spells).group("books.id").order("count(spells.id) ASC, name ASC")
            else
                @@reverse_order_count = "ASC"
                return Book.left_outer_joins(:spells).group("books.id").order("count(spells.id) DESC, name ASC")
            end
        else
            return Book.left_outer_joins(:spells).group("books.id").order("name ASC, count(spells.id) ASC")
        end
    end
    
#     #option 2 (on Campuswire)
#     @@reverse_order = false
    
#     def self.order_by field
#         if field == 'name'
#             if @@reverse_order == false
#                 @@reverse_order = true
#                 return Book.order(:name)
#             else
#                 @@reverse_order = false
#                 return Book.order(:name).reverse_order
#             end
#         elsif field == 'count'
#             if @@reverse_order == false
#                 @@reverse_order = true
#                 return Book.left_outer_joins(:spells).group("books.id").order("count(spells.id) ASC, name ASC")
#             else
#                 @@reverse_order = false
#                 return Book.left_outer_joins(:spells).group("books.id").order("count(spells.id) DESC, name ASC")
#             end
#         else
#             return Book.left_outer_joins(:spells).group("books.id").order("name ASC, count(spells.id) ASC")
#         end
#     end
end