//
//  NYTBestSellersTests.swift
//  NYTBestSellersTests
//
//  Created by fernando babonoyaba on 6/3/22.
//

import XCTest
@testable import NYTBestSellers

class NYTBestSellersTests: XCTestCase {

    private var network: ViewModelControllerProtocal?

    override func setUp() {
        super.setUp()
        network = ViewModelController(bookNetworkManager: MockNetworkManager())
        network?.createData(urlString: "test")
    }
    
    override func tearDown() {
        network = nil
        super.tearDown()
    }
    
    func testGetTitle() {
        XCTAssertEqual(network?.getTitle(0), "NIGHTWORK")
    }

    func testGetDescription() {
        XCTAssertEqual(network?.getDescription(0), "Harry Booth, a master thief, breaks things off with Miranda when a dangerous contact might harm her.")
    }

    func testGetCount() {
        XCTAssertEqual(network?.getCount(), 6)
    }

    func testGetAmazonProductURL() {
        XCTAssertEqual(network?.getAmazonProductURL(0), "https://www.amazon.com/dp/1250278198?tag=NYTBSREV-20")
    }

    func testGetAuthor() {
        XCTAssertEqual(network?.getAuthor(0), "Nora Roberts")
    }

    func testGetPublisher() {
        XCTAssertEqual(network?.getPublisher(0), "St. Martin's")
    }
}
