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
    func getCount() -> Int
    func getPublisher(_ row: Int) -> String?
    func getDescription(_ row: Int) -> String?
    func getTitle(_ row: Int) -> String?
    func getAuthor(_ row: Int) -> String?
    func getBookImage(_ row: Int, completion: @escaping (UIImage?) -> Void)
    func getAmazonProductURL(_ row: Int) -> String?
}

class ViewModelController: ViewModelControllerProtocal {
    
    var books = [Books]()
    // TODO: Remove
    weak var loadData: NetworkDelegate?
    
    private let bookNetworkManager: BookNetworkManagerProtocol?
    private let imageNetworkManager: ImageNetworkManagerProtocol?
    private var imageCache: [String: UIImage?] = [:]
    
    init(bookNetworkManager: BookNetworkManagerProtocol = BookNetworkManager(), imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager()){
        self.bookNetworkManager = bookNetworkManager
        self.imageNetworkManager = imageNetworkManager
    }
    
    func createData(urlString: String = NetworkURL.url) {
        createData(url: urlString)
    }
    
    private func createData(url: String?) {
        bookNetworkManager?.getBookList(urlString: url) { booksData in
            if let data = booksData {
                self.books = data
                DispatchQueue.main.async {
                    self.loadData?.dataFinished()
                }
            }
        }
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
    
    func getBookImage(_ row: Int, completion: @escaping (UIImage?) -> Void) {
        
        if let image =  self.imageCache[self.books[row].bookImage ?? ""] {
            completion(image)
            return
        }
        
        imageNetworkManager?.getImage(urlString: books[row].bookImage, completion: { image in
            self.imageCache[self.books[row].bookImage ?? ""] = image
            completion(image)
        })
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
