//
//  SearchedBookViewModel.swift
//  BooksApp
//
//  Created by beyza nur on 2.11.2023.
//

import Foundation

class SearchedBookViewModel{
    var books=[Items]()
    
    func fetchSearch(searchedBook:String,completion:@escaping ()->Void){
        WebService.shared.fetchSearch(searchedBook: searchedBook) { fetchedbooks in
            if let fetchedbooks=fetchedbooks{
                self.books=fetchedbooks
            } else {
                print("beyza")
                completion()

            }
        }
    }
}
