//
//  ViewController.swift
//  BooksApp
//
//  Created by beyza nur on 30.10.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var popularBookViewModel=PopularBooksViewModel()
    var softwareBookViewModel=SoftwareBooksViewModel()
    var historyBookViewModel=HistoryBooksViewModel()
    var romanticBookViewModel=RomanticBooksViewModel()
    var philosophyBookViewModel=PhilosophyBooksViewModel()
    
    var bookTypes=["popular","software","history","romantic","philosophy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
        getBookInf()
        
        
    }
    
    //baslıklar kac tane olsun
    func numberOfSections(in tableView: UITableView) -> Int {
        return bookTypes.count
    }
    
    //populer isimli kac sıra yer olsun
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //dizimizin içindekileri yazıyor
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return bookTypes[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as! BooksTableViewCell
    
        cell.collectionView.tag = indexPath.section
        
        let currentViewModel = bookTypes[indexPath.section]
        
        if currentViewModel == "popular" {
            cell.configurePopular(with: popularBookViewModel)
        } else if currentViewModel == "software" {
            cell.configureSoftware(with: softwareBookViewModel)
        } else if currentViewModel == "history" {
            cell.configureHistory(with: historyBookViewModel)
        } else if currentViewModel == "romantic" {
            cell.configureRomantic(with: romanticBookViewModel)
        }else if currentViewModel == "philosophy" {
            cell.configurePhilosophy(with: philosophyBookViewModel)
        }
        cell.selectedItem = { [weak self] selectedBook in
            if let detailsVC = self?.storyboard?.instantiateViewController(identifier: "details") as? DetailsViewController{
                detailsVC.volumeInfo = selectedBook
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
        }
        
        return cell
        
    }
    
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        let searchVc=storyboard?.instantiateViewController(withIdentifier: "search") as! SearchViewController
        navigationController?.pushViewController(searchVc, animated: false)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    
   
    func getBookInf () {
        popularBookViewModel.fetchPopular {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        softwareBookViewModel.fetchSoftware {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        historyBookViewModel.fetchHistory {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
       
        romanticBookViewModel.fetchRomantic {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } 
        philosophyBookViewModel.fetchPhilosophy {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    
}


