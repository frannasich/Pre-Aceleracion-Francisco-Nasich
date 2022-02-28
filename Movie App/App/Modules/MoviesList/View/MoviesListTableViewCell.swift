//
//  MoviesListTableViewCell.swift
//  Movie App
//
//  Created by Fran Nasich on 26/02/2022.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {


    @IBOutlet weak var movieLabelName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
