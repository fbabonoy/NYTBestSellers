//
//  NYTBestSellersTests.swift
//  NYTBestSellersTests
//
//  Created by fernando babonoyaba on 6/3/22.
//

import XCTest
@testable import NYTBestSellers

class lskdfj: XCTestCase {

    private var network: ViewModelControllerProtocal?

    override func setUp() {
        super.setUp()
        network = ViewModelController(bookNetworkManager: MockNetworkManager.self as! BookNetworkManagerProtocol)
//        ViewModelController(bookNetworkManager: MockNetworkManager())
        network?.createData(urlString: "test")
    }
    
    override func tearDown() {
        network = nil
        super.tearDown()
    }
    
//    func testViewModelName() {
//        XCTAssertEqual(network?.getTitle(0), "NIGHTWORK")
//    }
//
//    func testViewModelID() {
//        XCTAssertEqual(network?.getDescription(0), "02M260")
//    }
//
//    func testViewModelMathScore() {
//        XCTAssertEqual(network?.getCount(), 4)
//    }
//
//    func testViewModelReadingScore() {
//        XCTAssertEqual(network?.getAmazonProductURL(0), "355")
//    }
//
//    func testViewModelAuthor() {
//        XCTAssertEqual(network?.getAuthor(0), "363")
//    }
//
//    func testViewModelWritingScore() {
//        XCTAssertEqual(network?.getPublisher(0), "363")
//    }
}
