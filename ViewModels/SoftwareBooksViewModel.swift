//
//  SoftwareBooksViewModel.swift
//  BooksApp
//
//  Created by beyza nur on 31.10.2023.
//

import Foundation

class SoftwareBooksViewModel{
    var books=[Items]()
    
    func fetchSoftware(completion: @escaping () -> Void){
        WebService.shared.fetchSoftware { fetchedBook in
            if let fetchedBook=fetchedBook{
                self.books=fetchedBook
            }
            completion()
        }
    }
}
