//
//  DetailsViewController.swift
//  BooksApp
//
//  Created by beyza nur on 30.10.2023.
//

import UIKit
import SafariServices

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var volumeInfo: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        titleLabel.text=volumeInfo?.volumeInfo.title
        publishedDate.text=volumeInfo?.volumeInfo.publishedDate
        descriptionLabel.text=volumeInfo?.volumeInfo.description
        subtitleLabel.text=volumeInfo?.volumeInfo.subtitle
        if var url=URLComponents(string: (volumeInfo?.volumeInfo.imageLinks.thumbnail) ?? " "){
            url.scheme = "https"
            if let ImageUrl=url.url{
                if let imageData = try? Data(contentsOf: ImageUrl) {
                    let image = UIImage(data: imageData)
                    imageView.image = image
                    
                }
                
            }
        }
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
            let backVc=storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
            navigationController?.pushViewController(backVc, animated: false)
    }
    
    
    
    @IBAction func readButton(_ sender: Any) {
        if let urlString = volumeInfo?.volumeInfo.infoLink,let url = URL(string: urlString) {
            // URL açma işlemi
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        } else {
            // URL geçerli değilse veya URL yoksa kullanıcıya hata mesajı gösterebilirsiniz.
            let alert = UIAlertController(title: "Hata", message: "Kitabın URL'si geçerli değil.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    
}

