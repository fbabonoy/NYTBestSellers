//
//  NetworkManager.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import Foundation

protocol BookNetworkManagerProtocol {
    func getBookList(urlString: String?, completion: @escaping ([Books]?) -> ())
    
}

class BookNetworkManager: BookNetworkManagerProtocol {
    
    func getBookList(urlString: String?, completion: @escaping ([Books]?) -> ()) {
        
        RawNetworkManager.shared.getData(urlString: urlString) { result in
            
            switch result {
            case .success(let data):
                let schoolList = try? JSONDecoder().decode(Root.self, from: data)
                
                if let response = schoolList?.results?.books {
                    completion(response)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}
