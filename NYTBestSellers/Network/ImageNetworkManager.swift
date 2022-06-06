//
//  ImageNetworkManager.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/6/22.
//

import UIKit

protocol ImageNetworkManagerProtocol {
    func getImage(urlString: String?, completion: @escaping (UIImage?) -> ())
    
}

class ImageNetworkManager: ImageNetworkManagerProtocol {
    
    func getImage(urlString: String?, completion: @escaping (UIImage?) -> ()) {
        
        RawNetworkManager.shared.getData(urlString: urlString) { result in
            
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                completion(image)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}
