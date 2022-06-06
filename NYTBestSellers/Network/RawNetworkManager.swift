//
//  RawNetworkManager.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/6/22.
//

import Foundation

class RawNetworkManager {
    
    static let shared = RawNetworkManager()
    
    private init() { }
    
    func getData(urlString: String?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let urlUnwraped = urlString else { return }

        guard let url = URL(string: urlUnwraped) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else if let data1 = data {
                completion(.success(data1))
            }
            
        }.resume()
        
    }
    
    
    
}
