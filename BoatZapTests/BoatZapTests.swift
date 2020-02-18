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
        let littleBoatItem = BoatItem.init(name: "Row Boat", type: "Power" , make: "Hinckley", length: 8, price: 1199.99)
        XCTAssertNotNil(littleBoatItem)
        
        let bigBoatItem = BoatItem.init(name: "Island", type: "Power" , make: "Sun Seeker", length: 230, price: 60000000.00)
        XCTAssertNotNil(bigBoatItem)
        
    }
    func testBoatItemInitFails() {
            // Item with no make
        let noMakeItem = BoatItem.init(name: "Kids Inheritance", type: "Power" , make: "", length: 60, price: 150000.00)
            XCTAssertNil(noMakeItem)
            
        // Item with negative price
        let negPriceItem = BoatItem.init(name: "Usain Boat", type: "Power" , make: "C&C", length: 40, price: -100000.00)
            XCTAssertNil(negPriceItem)
        
        // Item with 0 lenth
        let zeroLenthItem = BoatItem.init(name: "ERROR 404 Fish Not Found", type: "Power" , make: "Viking", length: 0, price: 400000.00)
        XCTAssertNil(zeroLenthItem)
        
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
