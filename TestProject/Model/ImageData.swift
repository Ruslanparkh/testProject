//
//  ImageData.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 13.12.2021.
//

import Foundation
struct ImageData: Decodable {
        
    let search_metadata: SearchMetadata
    let search_parameters: SearchParameters
    let images_results: [ImagesResults]
    
    
        
struct SearchMetadata: Decodable {
    let id: String
    let google_url: String
}
struct SearchParameters: Decodable {
    let q: String
    let google_domain: String
}
    
struct ImagesResults: Decodable {
    let position: Int
    let original: String
    let thumbnail: String
    let source: String
    let title: String
    let link: String
    let is_product: Bool
    }
}
