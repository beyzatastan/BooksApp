//
//  BooksTableViewCell.swift
//  BooksApp
//
//  Created by beyza nur on 30.10.2023.
//

import UIKit

class BooksTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var popularBookViewModel=PopularBooksViewModel()
    var softwareBookViewModel=SoftwareBooksViewModel()
    var historyBookViewModel=HistoryBooksViewModel()
    var romanticBookViewModel=RomanticBooksViewModel()
    var philosophyBookViewModel=PhilosophyBooksViewModel()
    
    var bookTypes=["popular","software","history","romantic","philosophy"]
    
    //bu ne bilmiyorum
    var selectedItem: ((Items) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource=self
        collectionView.delegate=self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure() {
            self.popularBookViewModel.books = []
            self.softwareBookViewModel.books = []
            self.historyBookViewModel.books = []
            self.romanticBookViewModel.books = []
            self.philosophyBookViewModel.books = []
            self.collectionView.reloadData()
        }
        
    func configurePopular(with popular: PopularBooksViewModel) {
        self.popularBookViewModel = popular
        popular.fetchPopular {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    func configureSoftware(with software: SoftwareBooksViewModel) {
        self.softwareBookViewModel = software
        software.fetchSoftware {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
        }
    }
    
        func configureHistory(with history: HistoryBooksViewModel) {
        self.historyBookViewModel = history
        history.fetchHistory {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
      
        }
                      
        }
    }
        func configurePhilosophy(with philosophy: PhilosophyBooksViewModel) {
        self.philosophyBookViewModel = philosophy
        philosophy.fetchPhilosophy {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
      
        }
                      
        }
    }
    

    func configureRomantic(with romantic: RomanticBooksViewModel) {
    self.romanticBookViewModel = romantic
    romantic.fetchRomantic {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            }
        }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let currentViewModel = bookTypes[collectionView.tag]
        if currentViewModel == "popular" {
            return popularBookViewModel.books.count
        } else if currentViewModel == "software" {
            return softwareBookViewModel.books.count
        } else if currentViewModel == "history" {
            return historyBookViewModel.books.count
        } 
        else if currentViewModel == "romantic" {
           return romanticBookViewModel.books.count
       }
        else if currentViewModel == "philosophy" {
            return philosophyBookViewModel.books.count
        } else {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BooksCollectionViewCell
        
        if collectionView.tag == 0, !popularBookViewModel.books.isEmpty {
            let popular = popularBookViewModel.books[indexPath.item]
            if var imageURLComponents = URLComponents(string: (popular.volumeInfo.imageLinks.thumbnail)!) {
                imageURLComponents.scheme = "https"
                if let secureImageURL = imageURLComponents.url {
                    cell.imageView.load(url: secureImageURL)
                }
            }
        }
        else if collectionView.tag == 1, !softwareBookViewModel.books.isEmpty {
            let software = softwareBookViewModel.books[indexPath.item]
            if var imageURLComponents = URLComponents(string: (software.volumeInfo.imageLinks.thumbnail)!) {
                imageURLComponents.scheme = "https"
                if let secureImageUrl = imageURLComponents.url {
                    cell.imageView.load(url: secureImageUrl)
                }
            }
        } else if collectionView.tag == 2, !historyBookViewModel.books.isEmpty {
            let history = historyBookViewModel.books[indexPath.item]
            if var imageURLComponents = URLComponents(string: (history.volumeInfo.imageLinks.thumbnail)!) {
                imageURLComponents.scheme = "https"
                if let secureImageUrl = imageURLComponents.url {
                    cell.imageView.load(url: secureImageUrl)
                }
            }
        }  else if collectionView.tag == 3, !romanticBookViewModel.books.isEmpty {
            let romantic = romanticBookViewModel.books[indexPath.item]
            if var imageURLComponents = URLComponents(string: (romantic.volumeInfo.imageLinks.thumbnail)!) {
                imageURLComponents.scheme = "https"
                if let secureImageUrl = imageURLComponents.url {
                    cell.imageView.load(url: secureImageUrl)
                }
            }
        }
        else if collectionView.tag == 4, !philosophyBookViewModel.books.isEmpty {
            let philosophy = philosophyBookViewModel.books[indexPath.item]
            if var imageURLComponents = URLComponents(string: (philosophy.volumeInfo.imageLinks.thumbnail)!) {
                imageURLComponents.scheme = "https"
                if let secureImageUrl = imageURLComponents.url {
                    cell.imageView.load(url: secureImageUrl)
                }
            }
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let detailsVc=storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        // navigationController?.pushViewController(detailsVc, animated: false)
        
        
        let selectedBook: Items
        
        let currentViewModel = bookTypes[collectionView.tag]
        switch currentViewModel {
        case "popular":
            selectedBook = popularBookViewModel.books[indexPath.item]
        case "software":
            selectedBook = softwareBookViewModel.books[indexPath.item]
        case "history":
            selectedBook = historyBookViewModel.books[indexPath.item]
        case "philosophy":
            selectedBook = philosophyBookViewModel.books[indexPath.item]
        case "romantic":
            selectedBook = romanticBookViewModel.books[indexPath.item]
        default:
            return
        }
        
        selectedItem?(selectedBook)
        
        
    }
    
    
    
    
    
    
}    //cv işeri
        


