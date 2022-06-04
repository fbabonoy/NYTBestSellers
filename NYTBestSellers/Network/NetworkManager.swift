//
//  NetworkManager.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import Foundation

protocol NetworkManagerProtocol {
    func getBookList(urlString: String?, completion: @escaping ([Books]?) -> ())}

class NetworkManager: NetworkManagerProtocol {
    
    func getBookList(urlString: String?, completion: @escaping ([Books]?) -> ()) {
        guard let urlUnwraped = urlString else { return }

        guard let url = URL(string: urlUnwraped) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let schoolList = try? JSONDecoder().decode(Root.self, from: data)
                
                if let response = schoolList?.results?.books {
                    completion(response)
                }
                                
            }
            
        }.resume()
        
    }
    
}
