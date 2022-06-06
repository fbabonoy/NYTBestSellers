//
//  MockNetworkManager.swift
//  NYTBestSellersTests
//
//  Created by fernando babonoyaba on 6/6/22.
//

import Foundation
@testable import NYTBestSellers

class MockNetworkManager: BookNetworkManagerProtocol {
    
    func getBookList(urlString: String?, completion: @escaping ([Books]?) -> ()) {
        let bundle = Bundle(for: MockNetworkManager.self)
    
        guard let url = bundle.url(forResource: "schools", withExtension: "json")
        else { return  }
        
        do {
            let data = try Data(contentsOf: url)
            let articleList = try JSONDecoder().decode([Books].self, from: data)
            completion(articleList)
        } catch {
            print("error")
        }
    }
    
    
}
