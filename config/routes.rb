Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :books
    resources :spells
    
    root to: 'static_pages#home'
    
    #Spells Controller
    get 'spells/:id/add-spell-to-book', to: 'spells#add_spell_to_book', as: 'spell_add_spell_to_book'
    post 'spells/:id/add-spell-to-book', to: 'spells#add_book', as: 'spell_add_book'
  
    #Books Controller
    get 'books/:id/add-spell-to-book', to: 'books#add_spell_to_book', as: 'book_add_spell_to_book'
    post 'books/:id/add-spell-to-book', to: 'books#add_spell', as: 'book_add_spell'
#     post 'books/:id/add-spell-to-book', to: 'books#remove_spell', as: 'book_remove_spell'
#     post 'books/:id', to: 'books#add_spell', as: 'book_add_spell'
    post 'books/:id', to: 'books#remove_spell', as: 'book_remove_spell'

end
