//
//  MovieCellTableViewCell.swift
//  Now Playing
//
//  Created by Lixuan Lang on 10/21/17.
//  Copyright © 2017 Lixuan Lang. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
