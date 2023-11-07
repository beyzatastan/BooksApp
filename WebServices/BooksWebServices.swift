//
//  BooksWebServices.swift
//  BooksApp
//
//  Created by beyza nur on 30.10.2023.
//

import Foundation

class WebService{
    static let shared=WebService()
    
    //veri çekme fonks
    
    func fetchPopular(completion:@escaping ([Items]?)->Void){
        guard let url=URL(string: "https://www.googleapis.com/books/v1/volumes?q=popular&printType=books&key=AIzaSyCehkLSItOQw7uxms4ejTk3JE9BSe0fVYs") else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data=data , error == nil else{
                completion(nil)
                return
            }
            do{
            let response = try JSONDecoder().decode(BooksModel.self, from: data)
                let popularitems=response.items
                completion(popularitems)
            }catch{
                print("HATA: \(error.localizedDescription)")
            }
        }.resume()

    }
    
    func fetchSoftware(completion:@escaping ([Items]?)->Void){
        guard let url=URL(string:"https://www.googleapis.com/books/v1/volumes?q=software&printType=books&key=AIzaSyCehkLSItOQw7uxms4ejTk3JE9BSe0fVYs") else{
            completion(nil)
            return }
        URLSession.shared.dataTask(with:url) { data
            , response, error in
            guard let data=data, error==nil else{
                completion(nil)
                return
            }
            do{
                let response = try JSONDecoder().decode(BooksModel.self, from: data)
                let softwareitems=response.items
                completion(softwareitems)
            }catch{
                print(error.localizedDescription)
                
            }
        }.resume()
    }
    
    func fetchHistory(completion:@escaping ([Items]?)->Void){
        guard let url=URL(string:"https://www.googleapis.com/books/v1/volumes?q=history&printType=books&key=AIzaSyCehkLSItOQw7uxms4ejTk3JE9BSe0fVYs") else{
            completion(nil)
            return }
        URLSession.shared.dataTask(with:url) { data
            , response, error in
            guard let data=data, error==nil else{
                completion(nil)
                return
            }
            do{
                let response = try JSONDecoder().decode(BooksModel.self, from: data)
                let historyitems=response.items
                completion(historyitems)
            }catch{
                print(error.localizedDescription)
                
            }
        }.resume()
    }
    func fetchPhilosophy(completion:@escaping ([Items]?)->Void){
        guard let url=URL(string:"https://www.googleapis.com/books/v1/volumes?q=philosophy&printType=books&key=AIzaSyCehkLSItOQw7uxms4ejTk3JE9BSe0fVYs")
        else{
            completion(nil)
            return }
        URLSession.shared.dataTask(with:url) { data
            , response, error in
            guard let data=data, error==nil else{
                completion(nil)
                return
            }
            do{
                let response = try JSONDecoder().decode(BooksModel.self, from: data)
                let philosophyitems=response.items
                completion(philosophyitems)
            }catch{
                print("\(error.localizedDescription)")

            }
        }.resume()
    }
    

    
    func fetchRomantic(completion:@escaping ([Items]?)->Void){
        guard let url=URL(string:"https://www.googleapis.com/books/v1/volumes?q=romantic&printType=books&key=AIzaSyCehkLSItOQw7uxms4ejTk3JE9BSe0fVYs") else{
            completion(nil)
            return }
        URLSession.shared.dataTask(with:url) { data
            , response, error in
            guard let data=data, error==nil else{
                completion(nil)
                return
            }
            do{
                let response = try JSONDecoder().decode(BooksModel.self, from: data)
                let romanticitems=response.items
                completion(romanticitems)
            }catch{
                print("\(error.localizedDescription)")
            }
        }.resume()
    }
   
    
    func fetchSearch(searchedBook:String,completion:@escaping ([Items]?)->Void){
        guard let url=URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(searchedBook)&printType=books&key=AIzaSyCehkLSItOQw7uxms4ejTk3JE9BSe0fVYs")
                
        else{ completion(nil)
            return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data=data,error==nil else {
                completion(nil)
                return
            }
            do{
                let response = try JSONDecoder().decode(BooksModel.self, from: data)
                let searcheditems=response.items
                completion(searcheditems)
            }catch{
                print("\(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    
    
    
}
