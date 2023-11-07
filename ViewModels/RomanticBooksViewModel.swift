//
//  RomanticBooksViewModel.swift
//  BooksApp
//
//  Created by beyza nur on 31.10.2023.
//

import Foundation

class RomanticBooksViewModel{
    var books=[Items]()
    
    
    func fetchRomantic(completion:@escaping ()->Void){
        WebService.shared.fetchRomantic { fetchedBooks in
            if let fetchedBooks=fetchedBooks{
                self.books=fetchedBooks
            }
            completion()
        }
    }
}
