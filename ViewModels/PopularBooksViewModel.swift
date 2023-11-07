//
//  PopularBooksViewModel.swift
//  BooksApp
//
//  Created by beyza nur on 31.10.2023.
//

import Foundation

class PopularBooksViewModel{
    var books=[Items]()
    
    func fetchPopular(completion:@escaping ()->Void){
        WebService.shared.fetchPopular { fetchedbooks in
            if let fetchedbooks=fetchedbooks{
                self.books=fetchedbooks
            } else {
                print("beyza")
                completion()

            }
        }
    }
}
