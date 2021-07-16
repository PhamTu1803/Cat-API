//
//  DetailCatViewController.swift
//  Cat-tableview
//
//  Created by phamtu on 16/07/2021.
//

import UIKit
import Kingfisher

class DetailCatViewController: UIViewController {
    
    var image : String = ""
    
    @IBOutlet weak var catImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: image ?? ""){
            let processor = DownsamplingImageProcessor(size: catImg.bounds.size)
                |> RoundCornerImageProcessor(cornerRadius: 20)
            
            catImg.kf.indicatorType = .activity
            catImg.kf.setImage(
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

    //MARK: - BindData
    public func bindData(character: CatResponse) {
        if let url = character.url {
            self.image = url
            
        }
        
    }

}

extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
