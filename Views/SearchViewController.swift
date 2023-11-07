//
//  SearchViewController.swift
//  BooksApp
//
//  Created by beyza nur on 30.10.2023.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
  
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var tableView: UITableView!
  
    var bookItem = [Items]()
    var searchedBook=String()
    var searchedBookModel=SearchedBookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tableView.delegate=self
        tableView.dataSource=self
        
    }
    
    @IBAction func homeButton(_ sender: Any) {
        let homeVc=storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        navigationController?.pushViewController(homeVc, animated: false)
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        searchedBook=searchText.text!
        
        bookItem = searchedBookModel.books
        tableView.reloadData()

        searchedBookModel.fetchSearch(searchedBook: searchedBook) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedBookModel.books.count
    }
    
    func tableView(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"search" , for: indexPath) as! SearchTableViewCell
        let book = searchedBookModel.books[indexPath.row]

        cell.bookName.text = searchedBookModel.books[indexPath.row].volumeInfo.title
        cell.bookDate.text = searchedBookModel.books[indexPath.row].volumeInfo.publishedDate
        if var imageUrlComponents = URLComponents(string: book.volumeInfo.imageLinks.thumbnail!) {
            imageUrlComponents.scheme = "https"
            if let secureImageUrl = imageUrlComponents.url {
                if let data = try? Data(contentsOf: secureImageUrl) {
                    let image = UIImage(data: data)
                    cell.searchViewTableView.image = image
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(identifier: "details") as! DetailsViewController
        detailsVC.volumeInfo = bookItem[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
  
    
}
