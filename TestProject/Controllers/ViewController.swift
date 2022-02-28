//
//  ViewController.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 13.12.2021.
//

import UIKit
import Moya
import Kingfisher
import CoreData

class ViewController: UIViewController,UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    @IBAction func imageTapped(_ sender: Any) {
//                CollectionViewCell =
//    }
    
    var imageData: ImageData?
    var searchItem: String?
    let nibCell = UINib(nibName: I.cellIdentifier, bundle: nil)
    var needToFetch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        collectionView.register(UINib(nibName: I.cellNibName, bundle: nil), forCellWithReuseIdentifier: I.cellIdentifier)
        
    }
    
    func fecthPhotos(query: String){
        NetworkHelper.instance.searchImage(q: query).then { [self] result in
            self.imageData = result
            print(result)
            self.collectionView.reloadData()
            
            imageData?.images_results.enumerated().forEach { index, item in
                print("ИНДЕКС - \(index) ССЫЛКА НА КАРТИНКУ \(item.thumbnail)")
            }
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        if let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? FullImageView {
            SecondVC.OpenFullImage.image = cell?.imageView.image
            
            self.navigationController?.pushViewController(SecondVC, animated: true)
        }
//       performSegue(withIdentifier: "ShowFullImage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height

    if offsetY > contentHeight - scrollView.frame.height * 4 {
   
        }
        
    }

    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) -> Bool {
            if searchBar.text != "" {
                return true
            } else {
                searchBar.placeholder = "Type something"
                return false
            }
        
    }
    
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar!) {
        
        fecthPhotos(query: searchBar.text ?? "")
//        self.collectionView.reloadData()
       }

}
