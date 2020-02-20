//
//  BoatZapTests.swift
//  BoatZapTests
//
//  Created by Peter Aurigemma on 2/17/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import XCTest
@testable import BoatZap

class BoatZapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //------ BoatItem Class Tests ------
    func testBoatItemInitSucceeds() {
        let littleBoatItem = BoatItem.init(name: "Row Boat", type: "Power" , make: "Hinckley", length: 8, currentPrice: 1199.99)
        XCTAssertNotNil(littleBoatItem)
        let bigBoatItem = BoatItem.init(name: "Island", type: "Power" , make: "Sun Seeker", length: 230, currentPrice: 60000000.00)
        XCTAssertNotNil(bigBoatItem)
    }
    
    func testBoatItemInitFails() {
            // Item with no make
        let noMakeItem = BoatItem.init(name: "Kids Inheritance", type: "Power" , make: "", length: 60, currentPrice: 150000.00)
            XCTAssertNil(noMakeItem)
        // Item with negative price
        let negPriceItem = BoatItem.init(name: "Usain Boat", type: "Power" , make: "C&C", length: 40, currentPrice: -100000.00)
            XCTAssertNil(negPriceItem)
        // Item with 0 lenth
        let zeroLenthItem = BoatItem.init(name: "ERROR 404 Fish Not Found", type: "Power" , make: "Viking", length: 0, currentPrice: 400000.00)
        XCTAssertNil(zeroLenthItem)
    }
    
    func testBoatItemPriceDifference(){
        let bigBoatItem = BoatItem.init(name: "Island", type: "Power" , make: "Sun Seeker", length: 230, currentPrice: 60000000.00)
        bigBoatItem!.startingPrice = 61000000.00
        var total: Double
        total  = bigBoatItem!.returnPriceDifference(BoatItem: bigBoatItem!)
        XCTAssertEqual(-1000000.00, total)
    }
    //------ BoatListing Class Tests -----
    func testBoatListingAddItem() {
        let oneBoatItem = BoatItem.init(name: "Row Boat1", type: "Power" , make: "Hinckley", length: 8, currentPrice: 1199.99)
        let twoBoatItem = BoatItem.init(name: "Row Boat2", type: "Power" , make: "Hinckley", length: 8, currentPrice: 1199.99)
        let boatList = BoatListings.init()
        XCTAssertEqual(0, boatList.boats.count)
        boatList.addBoat(item: oneBoatItem!)
        XCTAssertEqual(1, boatList.boats.count)
        boatList.addBoat(item: twoBoatItem!)
        XCTAssertEqual(2, boatList.boats.count)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
