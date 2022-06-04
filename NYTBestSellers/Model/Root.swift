//
//  Root.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import Foundation

struct Root: Codable {
    let results: Results?
}

struct Results: Codable {
    let books: [Books]
}
