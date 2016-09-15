//
//  MailChimpListMemberTests.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 14/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import XCTest

class MailChimpListMemberTests: XCTestCase {
    
    var memberJsonText: Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "MailChimpListEntry", withExtension: "txt")!
        let contents = try! Data(contentsOf: url)
        return contents
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    func testParsingValidUser() {
        let jsonString = String(data:memberJsonText, encoding:String.Encoding.utf8)
        print(jsonString)
    }
}
