////
////  ImageManager.swift
////  TestProject
////
////  Created by Руслан Пархомюк on 26.12.2021.
////
//
//import Foundation
//
//protocol ImageManagerDeligate {
//    
//    struct ImageManager {
//        
//        let imageUrl = "https://serpapi.com/search.json?q=Apple&tbm=isch&ijn=0&api_key=8c8ee0d90e5cfa9aff6bc2282fc67ac68936d619502361142315407ecb64ba2c"
//        var deligate: ImageManagerDeligate?
//        
//        func fetchPhotos(q: String) {
//            let urlString = "\(imageUrl)&=\(q)"
//            performRequest(with: urlString)
//        }
//    
//        func performRequest(with urlString: String) {
//            if let url = URL(string: urlString) {
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url) { (data, response, error) in
//                    if error != nil {
//                        self.delegate?.didFailWithError(error: error!)
//                        return
//                    }
//                    if let safeData = data {
//                        if let weather = self.parseJSON(safeData) {
//                            self.delegate?.didUpdateImage(self, weather: weather)
//                        }
//                    }
//                }
//                task.resume()
//    }
//}
//    }
//    
//}
