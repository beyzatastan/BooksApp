//
//  SearchTableViewCell.swift
//  BooksApp
//
//  Created by beyza nur on 2.11.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var searchViewTableView: UIImageView!
    @IBOutlet weak var bookDate: UILabel!
    @IBOutlet weak var bookName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
