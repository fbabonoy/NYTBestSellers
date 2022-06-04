//
//  ViewModelController.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import Foundation
import UIKit

protocol NetworkDelegate: AnyObject {
    func dataFinished()
}

protocol  ViewModelControllerProtocal {
    func createData(urlString: String)
    func createImageData(urlString: String?) -> Data?
    func getCount() -> Int
    func getPublisher(_ row: Int) -> String?
    func getDescription(_ row: Int) -> String?
    func getTitle(_ row: Int) -> String?
    func getAuthor(_ row: Int) -> String?
    func getBookImage(_ row: Int) -> Data?
    func getAmazonProductURL(_ row: Int) -> String?
}

class ViewModelController: ViewModelControllerProtocal {
    
    var books = [Books]()
    weak var loadData: NetworkDelegate?
    
    private let networkManager: NetworkManagerProtocol?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()){
        self.networkManager = networkManager
    }
    
    func createData(urlString: String = NetworkURL.url) {
        createData(url: urlString)
    }
    
    private func createData(url: String?) {
        networkManager?.getBookList(urlString: url) { booksData in
            if let data = booksData {
                self.books = data
                DispatchQueue.main.async {
                    self.loadData?.dataFinished()
                }
            }
        }
    }
    
    func createImageData(urlString: String?) -> Data? {
        guard let urlU = urlString else { return nil }
        guard let url = URL(string: urlU) else { return nil}
        
        var data1 = Data()
        do {
            data1 = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.loadData?.dataFinished()
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return data1
    }
    
    func getCount() -> Int {
        books.count
    }
    
    func getAuthor(_ row: Int) -> String? {
        books[row].author
    }
    
    func getAmazonProductURL(_ row: Int) -> String? {
        books[row].amazonProductURL
    }
    
    func getBookImage(_ row: Int) -> Data? {
        createImageData(urlString: books[row].bookImage)
    }
    
    func getDescription(_ row: Int) -> String? {
        books[row].description
    }
    
    func getTitle(_ row: Int) -> String? {
        books[row].title
    }
    
    func getPublisher(_ row: Int) -> String? {
        books[row].publisher
    }
    
}
