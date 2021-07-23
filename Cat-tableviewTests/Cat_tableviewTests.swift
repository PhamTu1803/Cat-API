//
//  Cat_tableviewTests.swift
//  Cat-tableviewTests
//
//  Created by phamtu on 15/07/2021.
//

import XCTest
@testable import Cat_tableview

class CattableviewTests: XCTestCase {
    let service = CatService()
    private var viewModel = CatViewModel(isTest: true)
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetItem() throws {
        /*
         case1 : cellforow
         */
        let test1 = viewModel.numberOfRowsInSection(section: 1)
        XCTAssert( test1 == 0 )
    }
    
    func testGetApi() throws {
                var catItem: [CatResponse] = []
                catItem.append(CatResponse.init())
                viewModel.requestRepositories()
        let expectation = self.expectation(description: "testTrue")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(600)) { [self] in
            XCTAssertTrue(viewModel.numberOfRowsInSection(section: 0 ) == 1)
            expectation.fulfill()
        }
                
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
