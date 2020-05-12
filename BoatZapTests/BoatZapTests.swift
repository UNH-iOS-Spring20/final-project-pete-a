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
    
    //------ Boat Class Tests ------
    func testBoatInitSucceeds() {
        let littleBoatItem = Boat.init( id: "1", data: ["name" : "Row Boat", "type" : "Power" , "make" : "Hinckley", "length": "8", "price" : "1199.99" ,"address" : "123 School Rd. Essex, CT","latitude": "42.234","longitude": "43.234", "photo" :"boatPics/CCSailboat.jpg"])
        XCTAssertNotNil(littleBoatItem)
        let bigBoatItem = Boat.init( id: "1", data: ["name" : "Island", "type" : "Power" , "make" : "SunSeeker", "length": "280", "price" : "6001199.99" ,"address" : "12 school St. New Haven, CT" , "latitude": "42.124","longitude": "41.234", "photo" :"boatPics/CCSailboat.jpg"])
        XCTAssertNotNil(bigBoatItem)
    }
    
    func testBoatInitFails() {
        // Item with no make
        let noMakeItem = Boat.init(id: "1", data: ["name" : "Usain Boat", "type" : "Power" , "length": "40", "price" : "400000.99" ,"address" : "1123 High St. New Haven, CT" , "latitude": "42.124", "longitude": "41.234", "photo" :"boatPics/CCSailboat.jpg"])
        XCTAssertNil(noMakeItem)
        // Item with no photo
        let noPhotoItem = Boat.init(id: "1", data: ["name" : "Island", "type" : "Power" , "make" : "SunSeeker", "length": "280", "price" : "6001199.99" ,"address" : "12 school St. New Haven, CT" , "latitude": "42.124","longitude": "41.234"])
        XCTAssertNil(noPhotoItem)
    }
    
    //------ BoatPic tests
    func testPicInitSucceeds() {
        let testPic = BoatPics.init(id: "123456789010", data: ["url" : "boatPics/CCSailboat.jpg"])
        XCTAssertNotNil(testPic)
    }
    func testPicInitFails() {
        let testPicExtraItem = BoatPics.init(id: "123456789010", data: ["notAURL" : "boatPics/CCSailboat.jpg"])
        XCTAssertNil(testPicExtraItem)
    }

    //------ User tests
    func testUserInitSucceeds() {
        let testUser = User.init(id: "123456789010", data: ["firstName": "First Name", "lastName": "lastName", "email": "email"])
        XCTAssertNotNil(testUser)
    }
    func testUserInitFails() {
        let testUserFail = User.init(id: "123456789010", data: ["firstName": "First Name", "lastName": "lastName"])
        XCTAssertNil(testUserFail)
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
