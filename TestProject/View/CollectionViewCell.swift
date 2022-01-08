//
//  CollectionViewCell.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    

}
extension UIImageView {
    func setImage(from url: URL?) {
    image = nil

    var completion: (Result<RetrieveImageResult, KingfisherError>) -> Void = { _ in }

    completion = { [weak self] result in
    if let _ = try? result.get() {
    self?.layer.cornerRadius = 0
    self?.backgroundColor = nil
    } else {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    self?.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: completion)
        }
        
    }
        
}

    kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: completion)
    }
}
