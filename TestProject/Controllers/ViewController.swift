//
//  ViewController.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 13.12.2021.
//

import UIKit
import Moya
import Kingfisher

class ViewController: UIViewController,UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageData: ImageData?
    let nibCell = UINib(nibName: I.cellIdentifier, bundle: nil)
    var needToFetch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: I.cellNibName, bundle: nil), forCellWithReuseIdentifier: I.cellIdentifier)
        fecthPhotos()
        
        
    }
    
    func fecthPhotos(){
        NetworkHelper.instance.searchImage(q: "Apple").then { [self] result in
            self.imageData = result
            print(result)
            self.collectionView.reloadData()
        }.catch { error in
        print(error)
        }
        
    }
    
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//     return imageData?.images_results.count ?? 0
      return 10
     
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: I.cellIdentifier, for: indexPath)
            as! CollectionViewCell
        cell.imageView.setImage(from: URL(string: imageData?.images_results[indexPath.row].original ?? ""))
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 100, height: 100)
//
//}
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height

    if offsetY > contentHeight - scrollView.frame.height * 4 {
    if !needToFetch {
    fecthPhotos()
            }
        
        }
        
    }

}
