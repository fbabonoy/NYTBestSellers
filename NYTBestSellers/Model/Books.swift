//
//  Books.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import Foundation

struct Books: Codable {
    
    let publisher: String?
    let description: String?
    let title: String?
    let author: String?
    let bookImage: String?
    let amazonProductURL: String?
    
    enum CodingKeys: String, CodingKey {
        case publisher
        case description
        case title
        case author
        case bookImage = "book_image"
        case amazonProductURL = "amazon_product_url"
    }
}
