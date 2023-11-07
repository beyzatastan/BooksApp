//
//  PhilosophyBooksViewModel.swift
//  BooksApp
//
//  Created by beyza nur on 31.10.2023.
//

import Foundation

class PhilosophyBooksViewModel{
    var books=[Items]()
    func fetchPhilosophy(completion:@escaping ()->Void){
        WebService.shared.fetchPhilosophy { fetchedBooks in
            if let fetchedBooks=fetchedBooks{
                self.books=fetchedBooks
            }
            completion()
        }
    }
}
