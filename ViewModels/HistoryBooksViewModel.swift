//
//  HistoryBooksViewModel.swift
//  BooksApp
//
//  Created by beyza nur on 31.10.2023.
//

import Foundation
class HistoryBooksViewModel{
    var books=[Items]()
    
    func fetchHistory(completion:@escaping()->Void){
        WebService.shared.fetchHistory { fetchedBooks in
            if let fetchedBooks=fetchedBooks{
                self.books=fetchedBooks
            }
            completion()
        }
        
    }
    
}
