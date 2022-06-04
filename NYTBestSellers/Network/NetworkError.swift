//
//  NetworkError.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import Foundation

enum NetworkError: Error {
    
    case badURL
    case other(Error?)

}
