//
//  CollectionViewCell.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {

    weak var delegate: CollectionViewCellProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var didTapButton: UIButton!
    
    @IBAction func didTapButtonAction(_ sender: UIButton) {
        delegate?.didTapImage(cell: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    

}

extension UIImageView {
    
    func setImage(from url: URL?) {
        
        kf.setImage(
            with: url,
            placeholder: nil,
            options: nil,
            progressBlock: nil,
            completionHandler: { result in
                switch result {
                case let .success(value):
                    self.image = value.image
                case .failure:
                    self.image = UIImage(systemName: "doc")
                }
            }
        )
    }
}
