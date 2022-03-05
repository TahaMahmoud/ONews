//
//  NewsCell.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var shortDesc: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var newsDate: UILabel!

    @IBOutlet weak var newsImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(title: String, shortDesc: String, source: String, newsDate: String, image: String) {
        self.newsTitle.text = title
        self.shortDesc.text = shortDesc
        self.source.text = source
        self.newsDate.text = newsDate
        
        let imageURL = URL(string: image)
        
        self.newsImage.kf.setImage(with: imageURL, placeholder: UIImage(named: "logo"))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
