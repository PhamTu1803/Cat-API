//
//  CatTableViewCell.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import UIKit
import Kingfisher

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCat: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    /// - Parameter data: data from API
    func bindData(data: CatResponse) {
        if let url = URL(string: data.url ?? ""){
            let processor = DownsamplingImageProcessor(size: img.bounds.size)
                |> RoundCornerImageProcessor(cornerRadius: 20)

            img.kf.indicatorType = .activity
            img.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
}
