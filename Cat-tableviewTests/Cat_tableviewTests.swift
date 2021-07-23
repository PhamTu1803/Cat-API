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
    private var viewModel = CatViewModel()
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
        let section = 1
        /*
         case 1 : test call api
         */
//        // Arrange
//        let controller = CatViewController()
//        // Act
//        controller.viewDidLoad()
//        let userCount = controller.catTbview.numberOfSections
//
//        // Assert
//        XCTAssertTrue(userCount == 1 , "User count is incorrect!")
                var catItem: [CatResponse] = []
                catItem.append(CatResponse.init(id: 1, url: "https://i.thatcopy.pw/cat/3UJTX32.jpg", webpurl: "https://i.thatcopy.pw/cat-webp/3UJTX32.webp"))
                XCTAssert(viewModel.numberOfRowsInSection(section: section ) == 0)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
